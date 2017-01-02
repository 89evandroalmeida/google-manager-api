class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def index
    respond_with UserFacade.read_users(params)
  end

end
