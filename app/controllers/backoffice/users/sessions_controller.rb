class Users::SessionsController < DeviseTokenAuth::SessionsController
  prepend_before_action :require_no_authentication, only: %i[new create]
  protect_from_forgery

  respond_to :html, :json

  # GET /resource/sign_in
  def new
    self.resource = self.resource_class.new(sign_in_params)
    store_location_for(resource, params[:redirect_to])
    clean_up_passwords(resource)
    yield resource if block_given?
    # render template: 'devise/sessions/new'
    respond_with(resource, location: new_user_session_path)
  end

  # POST /resource/sign_in
  def create
    respond_to do |format|
      format.json do
        super
      end

      format.html do
        authenticate_with_html_response
      end
    end
  end # DELETE /resource/sign_out

  def destroy
    super
  end

  # protected
  def response_sign_in_json
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      render json: user.as_json

    else
      render json: { message: 'Email ou senha Inválidos.' },
             status: :unauthorized
    end
  end

  def authenticate_with_html_response
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
