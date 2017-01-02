module Connection
  require 'google/api_client'

  key = Google::APIClient::PKCS12.load_key(ENV['GOOGLE_PKC12_FILE_PATH'], ENV['GOOGLE_SECRET'])
  scopes = ['https://www.googleapis.com/auth/admin.directory.user', 'https://www.googleapis.com/auth/admin.directory.group']
  asserter = Google::APIClient::JWTAsserter.new(ENV['GOOGLE_EMAIL'], scopes, key)
  client = Google::APIClient.new(:application_name => ENV['GOOGLE_APP_NAME'])
  client.authorization = asserter.authorize(ENV['GOOGLE_BEHALF'])

  @@client = client
  @@api = client.discovered_api('admin', 'directory_v1')

end
