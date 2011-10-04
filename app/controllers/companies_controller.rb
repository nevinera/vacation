class CompaniesController < ApplicationController
  before_filter :authenticate_user!
  skip_authorization_check

  def index
    if current_user.manager?
      redirect_to company_path(current_user.company)
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @company = Company.find(params[:id]) 

    @users = @company.users.all
  end
end
