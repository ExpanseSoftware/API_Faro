class CategoriesController < ApplicationController
  before_action :set_category, only: [:update]
  before_action :validate_user, only: [:create, :update]
  before_action :validate_type, only: [:create, :update]

  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    @category = Category.new(category_params)
    save_in_db(@category)
  end

  def update
    update_db(@category, category_params)
  end

  private
  def category_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    #params.require(:category).permit(:category_name, :category_description)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
