class CompanyTypesController < ApplicationController
  before_action :validate_user, only: [:create, :update]
  before_action :validate_type, only: [:create, :update]
  def index
    @company_types = CompanyType.all
    render json: @company_types
  end

  def create
    @company_type = CompanyType.new(company_type_params)
    save_in_db(@company_type)
  end

  def update
    @company_type = CompanyType.find(params[:id])
    update_db(@company_type, company_type_params)
  end

  private
  def company_type_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

  #def company_type_params
  #  params.require(:company_type).permit(:company_type_name)
  #end
end
