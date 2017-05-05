class GitHubContributorsController < ApplicationController
  def home
    @user = GitHubContributor.new
  end

  def show
    puts params
    @user = GitHubContributor.new(git_hub_contributor_params)
    if @user.valid?
      @username = @user.username
      @profile = @user.profile
    else
      render action: 'home'
    end
  end

  def git_hub_contributor_params
    params.permit(:username)
  end
end
