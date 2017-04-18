class BranchTypesController < ApplicationController
  def index
    @branch_types = BranchType.all
    render json: @branch_types
  end

  def create
    @branch_type = BranchType.new(branch_type_params)
    save_in_db(@branch_type)
  end

  def update
    @branch_type = BranchType.find(params[:id])
    update_db(@branch_type, branch_type_params)
  end

  private
  def branch_type_params
    #params.require(:branch_type).permit(:branch_type_name)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
