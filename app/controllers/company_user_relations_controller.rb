class CompanyUserRelationsController < ApplicationController
  
  def follow
    @userType = UserType.new(user_id: set_user.id,
      company_id: params[:company_id],
      user_status: 'seguidor')
    save_in_db(@userType)
  end

  def add_admin_user
    @userType = UserType.new(user_id: set_user.id,
      company_id: params[:company_id],
      user_status: 'admin')
    save_in_db(@userType)
  end

  def stop_follow
    @userType = UserType.find_by(user_id: set_user.id,
      company_id: params[:company_id],
      user_status: 'seguidor')
    @userType.destroy
  end

  def remove_admin_user
    @userType = UserType.find_by(user_id: set_user.id,
      company_id: params[:company_id],
      user_status: 'admin')
    @userType.destroy
  end

end
