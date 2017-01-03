class UserFacade
  include Connection

  def self.create_user params
    request = {
      :api_method => @@api.users.insert,
      :body_object => {
        :primaryEmail => params[:primaryEmail],
        :password     => params[:password],
        :orgUnitPath  => params[:orgUnitPath],
        :name         => {
          :givenName    => params[:givenName],
          :familyName   => params[:familyName]
        }
      }
    }
    @@client.execute(request).data
  end

  def self.read_users params
    results = []
    request = {
      :api_method => @@api.users.list,
      :parameters => params
    }
    # fetches all the pages
    loop do
      result = @@client.execute request
      results << result.data
      break unless result.next_page_token
      request = result.next_page
    end
    results
  end

  def self.update_user_status params
    request = {
      :api_method  => @@api.users.update,
      :parameters  => {
        :userKey     => params[:userKey]
      },
      :body_object => {
        :suspended   => params[:suspended]
      }
    }
    @@client.execute(request).data
  end

end
