class InternalUser < ApplicationRecord

  before_create :generate_api_key

  protected

  def generate_api_key
    self.api_key = SecureRandom.urlsafe_base64
    generate_api_key if InternalUser.exists?(api_key: self.api_key)
  end

end
