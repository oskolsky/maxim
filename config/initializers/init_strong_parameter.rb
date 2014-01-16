DeviseController.class_eval do
  def resource_params
    unless params[resource_name].blank?
      params.require(resource_name).permit(:email, :name, :nickname, :password, :password_confirmation, :remember_me)
    end
  end
end