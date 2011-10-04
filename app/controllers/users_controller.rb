class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = params[:id].present? ? User.find(params[:id]) : current_user
    authorize! :show, @user
  end
end
