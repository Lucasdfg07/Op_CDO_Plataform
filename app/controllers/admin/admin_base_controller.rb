module Admin
  class AdminBaseController < ApplicationController
    before_action :authenticate_admin!

    private

    def authenticate_admin!
      authenticate_user!
      unless current_user&.admin?
        flash[:alert] = t('user.session.denied')
        redirect_to root_path
      end
    end
  end
end