class Api::V1::UsersController < Api::ApiController

  def index
    respond_to do |format|
      format.json { render json: { 'status': 'OK' } }
    end
  end

end
