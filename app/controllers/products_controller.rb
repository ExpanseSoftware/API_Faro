class ProductsController < ApplicationController
  before_action :set_company, only: [:create]

  def index
    @products = Product.all
    render json: @products
  end

  def create
    @product = @company.products.build(product_params)
    save_in_db(@product)
  end

  def update
    @product = Product.find(get_id)
    update_db(@product, product_params)
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :product_description, :product_price,
      :product_sold_quantity)
  end

end
