class SessionsController < Devise::SessionsController
  before_action do logger.info(request.headers['authentication']) end

  def create
    respond_to do |format|
      format.html { super }
      format.json do
        self.resource = warden.authenticate!(:scope => resource_name, :store => !(request.format.xml? || request.format.json?))

        sign_in(resource_name, resource)
        data = {
          user_token: self.resource.authentication_token,
          user_email: self.resource.email,
          user_username: self.resource.username,
          user_id: self.resource.id
        }
        render json: data, status: 201
      end
    end
  end
end
