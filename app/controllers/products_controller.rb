class ProductsController < ApplicationController
  before_action :set_company, only: [:create]
  before_action :set_product, only: [:update, :get_down]
  before_action :verify_user_privileges, except: [:index, :show]

  def index
    @products = Product.all
    render json: @products
  end

  def show
    render json: @product
  end

  def create
    @product = @company.products.build(product_params)
    save_in_db(@product)
  end

  def update
    update_db(@product, product_params)
  end

  def get_down
    update_db(@product, :product_active => false)
  end

  private
  def product_params
    #params.require(:product).permit(:product_name, :product_description, :product_price,
    #  :product_sold_quantity)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

end
