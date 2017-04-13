class CompaniesController < ApplicationController
  before_action :set_company, only: [:update]

  def index
    @companies = Company.all
    render json: @companies
  end

  def show
    render json: @company
  end

  def create
    @user = User.find(params[:user_id])
    @company = @user.companies.build(company_params)
    @userType = UserType.new(user_status: 'admin', user_id: @user.id, company_id: @company.id)
    if @userType.valid?
      save_in_db(@company)
      save_in_db(@userType)
    end
  end

  def update
    update_db(@company, company_params)
  end

  def get_down
    update_db(@company, :company_active => false)
  end

  private
  def company_params
    params.require(:company).permit(:category_id, :company_type_id, :company_name,
      :company_description)
  end
end
