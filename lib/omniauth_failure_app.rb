class OmniauthFailureApp < Devise::FailureApp
  protected
  def redirect_url
    auth_path
  end
end
