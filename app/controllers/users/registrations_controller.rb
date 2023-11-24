class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params[:password]
      resource.password = params[:password]
      resource.password_confirmation = params[:password_confirmation]
    end

    resource.update_without_password(params)
  end

  private

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end