class GitHubContributorsController < ApplicationController
  def home
  end

  def show
    user = GitHubContributor.new(username: params[:username])
    if user.valid?
      @username = user.username
      user.get_profile
    end
  end
end
