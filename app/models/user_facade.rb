class UserFacade
  include Connection

  def self.read_users params
    results = []
    request = {
      :api_method => @@api.users.list,
      :parameters => params
    }
    # fetches all the pages
    loop do
      result = @@client.execute(request)
      results << JSON.parse(result.body)
      break unless result.next_page_token
      request = result.next_page
    end
    results
  end

end
