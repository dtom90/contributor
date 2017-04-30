class GitHubContributor
  include ActiveModel::Model
  attr_accessor :username
  validates_presence_of :username

  def get_profile
    response = Faraday.get "https://github.com/#{self.username}"
    puts response.body
  end
end