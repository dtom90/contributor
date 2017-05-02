class GitHubContributor
  include ActiveModel::Model
  attr_accessor :username
  validates_presence_of :username
  validate :github_profile

  def github_profile
    profile_url = "https://github.com/#{self.username}"
    begin
      doc = Nokogiri::HTML(open profile_url)
      {
          url: profile_url,
          avatar: doc.css('img.avatar')[0].to_s,
          contribution_graph: doc.css('.js-contribution-graph')[0].to_s
      }
    rescue OpenURI::HTTPError => e
      errors.add :username, "Couldn't find a GitHub profile for this username."
    end
  end
end