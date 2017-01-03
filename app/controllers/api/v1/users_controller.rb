class Api::V1::UsersController < Api::ApiController
  before_action :authenticate

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

      render json: User.create(params)
    rescue Exception => e
      render json: e
    end
  end

  def check
    begin
      expected_params = [
        :userKey
      ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)

      render json: User.check(params)
    rescue Exception => e
      render json: e
    end
  end

  def read_all
    begin
      expected_params = [ :domain ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)

      render json: User.read_all(params)
    rescue Exception => e
      render json: e
    end
  end

  def update_suspended
    begin
      expected_params = [
        :userKey,
        :suspended
      ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)

      render json: User.update_suspended(params)
    rescue Exception => e
      render json: e
    end
  end

end
