class Api::V1::MembershipController < Api::ApiController
  before_action :authenticate

  def create
    begin
      expected_params = [
        :groupKey,
        :email,
        :role
      ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)

      render json: Membership.create(params)
    rescue Exception => e
      render json: e
    end
  end

  def check
    begin
      expected_params = [
        :groupKey,
        :memberKey
      ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)

      render json: Membership.check(params)
    rescue Exception => e
      render json: e
    end
  end

  def destroy
    begin
      expected_params = [
        :groupKey,
        :memberKey
      ]
      ActionController::Parameters.new(params)
        .permit(expected_params)
        .require(expected_params)

      render json: Membership.destroy(params)
    rescue Exception => e
      render json: e
    end
  end

end
