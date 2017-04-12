class ServicesController < ApplicationController
  before_action :set_company, only: [:create]
  before_action :set_service, only: [:update]

  def index
    @services = Service.all
    render json: @services
  end

  def create
    @service = @company.services.build(service_params)
    save_in_db(@service)
  end

  def update
    update_db(@service, service_params)
  end

  private
  def service_params
    params.require(:service).permit(:service_name, :service_description)
  end
end
