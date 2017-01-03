class Api::V1::UsersController < Api::ApiController
  respond_to :json

  before_action :authenticate

  def index
    respond_with UserFacade.read_users(params)
  end

end
