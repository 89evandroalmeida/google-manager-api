class Api::ApiController < ActionController::Base

  protected

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      Rails.logger.debug 'ApiController authenticate token'
      Rails.logger.debug token.inspect
      @user = InternalUser.where(api_key: token).first
    end
  end

end
