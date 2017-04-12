class CompanyUserRelationsController < ApplicationController
  before_action :set_user_type, except: [:add_relation_user_company]

  def add_relation_user_company
    @userType = UserType.new(company_user_relation_params)
    save_in_db(@userType)
  end

  def update_relation_user_company
    update_db(@userType, {:user_status => params[:user_new_status]})
  end

  def destroy_relation_user_company
    @userType.destroy
  end

  private
  def company_user_relation_params
    params.require(:company_user_relation).permit(:company_id, :user_id, :user_status)
  end

  def set_user_type
    @userType = UserType.find_by(user_id: params[:user_id],
      company_id: params[:company_id],
      user_status: params[:user_status])
  end
end
