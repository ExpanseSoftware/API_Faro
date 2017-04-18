class ServicesController < ApplicationController
  before_action :set_company, only: [:create]
  before_action :set_service, only: [:update, :get_down]
  before_action :verify_user_privileges, except: [:index, :show]

  def index
    @services = Service.all
    render json: @services
  end

  def show
    render json: @service
  end

  def create
    @service = @company.services.build(service_params)
    save_in_db(@service)
  end

  def update
    update_db(@service, service_params)
  end

  def get_down
    update_db(@service, :service_active => false)
  end

  private
  def service_params
    #params.require(:service).permit(:service_name, :service_description)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
