class Api::V1::UsersController < Api::ApiController
  before_action :authenticate

  def index
    begin
      expected_params = [ :domain ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)

      render json: UserFacade.read_users(params)
    rescue Exception => e
      render json: e
    end
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

      render json: UserFacade.create_user(params)
    rescue Exception => e
      render json: e
    end
  end

  def update
    begin
      expected_params = [
        :userKey,
        :suspended
      ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)

      render json: UserFacade.update_user_status(params)
    rescue Exception => e
      render json: e
    end
  end

end
