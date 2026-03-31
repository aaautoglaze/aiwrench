module Admin
  class BaseController < ApplicationController
    layout "admin"

    before_action :require_login

    private

    def require_login
      unless current_admin
        redirect_to admin_login_path, alert: "Please log in."
      end
    end

    def current_admin
      @current_admin ||= AdminUser.find_by(id: session[:admin_user_id])
    end

    helper_method :current_admin
  end
end
