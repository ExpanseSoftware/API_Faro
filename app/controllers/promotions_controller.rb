class PromotionsController < ApplicationController
  before_action :set_company, only: [:create]
  before_action :set_product, only: [:add_product_to_a_promotion, :remove_product_from_a_promotion]
  before_action :set_service, only: [:add_service_to_a_promotion, :remove_service_from_a_promotion]
  before_action :set_promotion, except: [:index, :create]
  before_action :set_branch, except: [:index, :create, :update,
    :remove_service_from_a_promotion, :remove_product_from_a_promotion]
  after_action :add_branch_promo_status, only: [:add_branch_to_a_promotion,
    :add_service_to_a_promotion, :add_product_to_a_promotion]
  after_action :remove_branch_promo_status, only: [:remove_branch_from_a_promotion,
    :remove_product_from_a_promotion, :remove_service_from_a_promotion]

  def index
    @promotions = PromoRelation.all
    render json: @promotions
  end

  def create
    @promotion = @company.promotions.build(promotion_params)
    save_in_db(@promotion)
  end

  def update
    update_db(@promotion, promotion_params)
  end

  def add_branch_to_a_promotion
    @promo_relation = @branch.branch_promotion_relations.new(promotion_id: @promotion.id)
    save_in_db(@promo_relation)
  end

  def remove_branch_from_a_promotion
    @promo_relation = @branch.branch_promotion_relations.find_by(promotion_id: @promotion.id)
    @promo_relation.destroy
  end

  def add_service_to_a_promotion
    @promo_relation = @service.promo_relations.build(promotion_id: @promotion.id, branch_id: @branch.id)
    save_in_db(@promo_relation)
  end

  def remove_service_from_a_promotion
    @promo_relation = @service.promo_relations.find_by(promotion_id: @promotion.id)
    @promo_relation.destroy
  end

  def add_product_to_a_promotion
    @promo_relation = @product.promo_relations.build(promotion_id: @promotion.id, branch_id: @branch.id)
    save_in_db(@promo_relation)
  end

  def remove_product_from_a_promotion
    @promo_relation = @product.promo_relations.find_by(promotion_id: @promotion.id)
    @promo_relation.destroy
  end

  private
  def promotion_params
    params.require(:promotion).permit(:promotion_name, :promotion_description)
  end

  def add_branch_promo_status
    if !@branch.branch_promotion_status
      update_db(@branch, {:branch_promotion_status => true})
    end
  end

  def remove_branch_promo_status
    if PromoRelation.exists?(branch_id: @branch.id) != true
      update_db(@branch, {:branch_promotion_status => false})
    end
  end
end
