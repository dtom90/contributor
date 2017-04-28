class GitHubContributorsController < ApplicationController
  def home
  end

  def show
    user = GitHubContributor.new(username: params[:username])
    if user.valid?
      @username = user.username
    end
  end
end
