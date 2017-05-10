class ContributorsController < ApplicationController
  def home
    if params[:username]# and not params[:username].empty?
      show
      render action: 'show' and return if @user.valid?
    end
    @user = Contributor.new
  end

  def show
    @user = Contributor.new(contributor_params)
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

  def contributor_params
    params.permit(:username)
  end
end
