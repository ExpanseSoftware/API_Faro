class BranchesController < ApplicationController
  before_action :set_branch, except: [:index, :create]
  before_action :set_company, only: [:create]
  before_action :set_product, only: [:add_product_to_a_branch, :remove_product_from_a_branch]
  before_action :set_service, only: [:add_service_to_a_branch, :remove_service_from_a_branch]

  def index
    @branches = Branch.all
    render json: @branches
  end

  def create
    @branch = @company.branches.build(branch_params)
    save_in_db(@branch)
  end

  def add_product_to_a_branch
    @branchProduct = BranchesProduct.new(branch_id: @branch.id, product_id: @product.id)
    save_in_db(@branchProduct)
  end

  def add_service_to_a_branch
    @branchService = BranchesService.new(branch_id: @branch.id, service_id: @service.id)
    save_in_db(@branchService)
  end

  def remove_product_from_a_branch
    @branchProduct = BranchesProduct.find_by(branch_id: @branch.id, product_id: @product.id)
    @branchProduct.destroy
  end

  def remove_service_from_a_branch
    @branchService = BranchesService.find(branch_id: @branch.id, service_id: @service.id)
    @branchService.destroy
  end

  def update
    update_db(@branch, branch_params)
  end

  private
  def branch_params
    params.require(:branch).permit(:branch_type_id, :branch_address,
      :branch_coordinates)
  end

end
