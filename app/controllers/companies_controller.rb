class CompaniesController < ApplicationController
  before_action :set_company, only: [:update, :show]
  before_action :validate_user, only: [:create, :update, :get_down]
  before_action :validate_type, only: [:create, :update]
  before_action :set_user, only: [:create]

  def index
    @companies = Company.all
    render json: @companies
  end

  def show
    render json: @company
  end

  def create
    @company = Company.new(company_params)
    @company.save && @company.user_types.create(user_status: 'admin', user_id: @user.id)
  end

  def update
    update_db(@company, company_params)
  end

  def get_down
    update_db(@company, :company_active => false)
  end

  private
  def company_params
    #params.require(:company).permit(:category_id, :company_type_id, :company_name,
    #  :company_description)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
