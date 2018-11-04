require 'open-uri'

class Contributor
  include ActiveModel::Model
  
  attr_accessor :username
  validates_presence_of :username
  
  attr_reader :profile
  validate :github_profile

  def github_profile
    profile_url = "https://github.com/#{self.username}"
    begin
      doc = Nokogiri::HTML(open profile_url)
      
      contributions = {}
      doc.css('rect.day').each do |day|
        contributions[day['data-date']] = day['data-count']
      end

      last_week_total = sum(contributions, 7)
      last_month_total = sum(contributions, 30)
      last_year_total = sum(contributions, 0)
      
      @profile = {
          url: profile_url,
          avatar: doc.css('img.avatar')[1].to_s,
          contribution_graph: doc.css('.js-yearly-contributions')[0].to_s,
          contributions: contributions,
          last_week_total: last_week_total,
          last_month_total: last_month_total,
          last_year_total: last_year_total,
          total_days: contributions.keys.length
      }
    rescue OpenURI::HTTPError
      errors.add :username, "Couldn't find a GitHub profile for this username."
    end
  end
  
  private
  
  def sum(contributions, num_days)
    contributions.slice(*contributions.keys[-num_days..-1]).values.map{|c| c.to_i}.inject(0, :+)
  end
  
end