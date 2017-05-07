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
      respond_to do |format|
        format.html {
          @username = @user.username
          @profile = @user.profile
        }
        format.json { 
          render json: { @user.username => @user.profile[:contributions] }
        }
      end
    else
      render action: 'home'
    end
  end

  def git_hub_contributor_params
    params.permit(:username)
  end
end
