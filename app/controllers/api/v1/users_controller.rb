class Api::V1::UsersController < Api::ApiController
  respond_to :json
  before_action :authenticate

  def index
    respond_with UserFacade.read_users(params)
  end

  def create
    begin
      expected_params = [
        :primaryEmail,
        :password,
        :orgUnitPath,
        :givenName,
        :familyName
      ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)
      respond_with UserFacade.create_user(params), :location => nil
      # ":location => nil" avoids redirection after POST
    rescue Exception => e
      respond_with e, :location => nil
    end
  end

end
