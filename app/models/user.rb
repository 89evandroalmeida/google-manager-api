class User
  include Connection

  def self.create params
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

  def self.check params
    request = {
      :api_method => @@api.users.get,
      :parameters => {
        :userKey   => params[:userKey]
      }
    }
    !@@client.execute(request).error?
  end

  def self.read_all params
    results = []
    request = {
      :api_method => @@api.users.list,
      :parameters => {
        :domain     => params[:domain]
      }
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

  def self.update_suspended params
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
