class ContributorsController < ApplicationController
  def home
  end

  def show
    @username = params[:username]
  end
end
