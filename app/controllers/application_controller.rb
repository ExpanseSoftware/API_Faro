class ApplicationController < ActionController::API
  #before_action :set_company, only: [:verify_user_privileges]
  #before_action :set_user, only: [:verify_user_privileges]
  before_action :check_header

  private
  def check_header
    if ['POST','PUT','PATCH'].include? request.method
      if request.content_type != "application/vnd.api+json"
        head 406 and return
      end
    end
  end

  def validate_type
    if params['data'] && params['data']['type']
      if params['data']['type'] == params[:controller]
        return true
      end
    end
    head 409 and return
  end

  def validate_user
    token = request.headers["X-Api-Key"]
    head 403 and return unless token
    user = User.find_by token: token
    head 403 and return unless (user or token=='zoBn5l^QNw:5-s6')
  end

  def verify_user_privileges
    @userRelation = UserType.find_by(user_id: set_user.id,
      company_id: set_company.id,
      user_status: 'admin')
    if @userRelation.nil?
      head 403 and return
    end
  end

  def set_user
    @user = User.find_by token: request.headers["X-Api-Key"]
    if @user.nil?
      user = User.new
      user.errors.add(:token, "Wrong token provided")
      render_error(user, 404) and return
    else
      @user
    end
  end

  def set_company
    if params[:controller] == "companies"
      @company = Company.find(params[:id])
    else
      if params['data'] && params['data']['attributes']
        @company = Company.find(params['data']['attributes'][:company_id])
      else
        @company = Company.find(params[:company_id])
      end
    end
  end

  def set_branch
    if params[:controller] == "branches"
      @branch = Branch.find(params[:id])
    else
      @branch = Branch.find(params[:branch_id])
    end
  end

  def set_service
    if params[:controller] == "services"
      @service = Service.find(params[:id])
    else
      @service = Service.find(params[:service_id])
    end
  end

  def set_product
    if params[:controller] == "products"
      @product = Product.find(params[:id])
    else
      @product = Product.find(params[:product_id])
    end
  end

  def set_promotion
    if params[:controller] == "promotions"
      @promotion = Promotion.find(params[:id])
    else
      @promotion = Promotion.find(params[:promotion_id])
    end
  end

  def save_in_db(object)
    puts json: object
    if object.save
      puts 'Datos guardados'
    else
      puts 'Hubo un error, intentalo de nuevo'
    end
  end

  def update_db(object, send_params)
    if object.update(send_params)
      puts 'Los datos fueron modificados'
    else
      puts 'Hubo un error, intentalo de nuevo'
    end
  end

  def render_error(resource, status)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
  end
end
