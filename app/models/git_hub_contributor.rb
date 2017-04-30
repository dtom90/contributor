class GitHubContributor
  include ActiveModel::Model
  attr_accessor :username
  validates_presence_of :username

  def get_profile
    profile_url = "https://github.com/#{self.username}"
    doc = Nokogiri::HTML(open profile_url)
    doc.css('.js-contribution-graph')[0].to_s
  end
end