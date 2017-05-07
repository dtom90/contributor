class GitHubContributorsController < ApplicationController
  def home
    if params[:username]# and not params[:username].empty?
      show
      render action: 'show' and return if @user.valid?
    end
    @user = GitHubContributor.new
  end

  def show
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
