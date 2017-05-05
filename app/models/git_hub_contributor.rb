class GitHubContributor
  include ActiveModel::Model
  
  attr_accessor :username
  validates_presence_of :username
  
  attr_reader :profile
  validate :github_profile

  def github_profile
    profile_url = "https://github.com/#{self.username}"
    begin
      puts "opening #{profile_url}..."
      doc = Nokogiri::HTML(open profile_url)
      @profile = {
          url: profile_url,
          avatar: doc.css('img.avatar')[0].to_s,
          contribution_graph: doc.css('.js-contribution-graph')[0].to_s
      }
    rescue OpenURI::HTTPError => e
      errors.add :username, "Couldn't find a GitHub profile for this username."
    end
  end
end