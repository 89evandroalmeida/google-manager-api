class Membership
  include Connection

  def self.create params
    request = {
      :api_method  => @@api.members.insert,
      :parameters  => {
        :groupKey    => params[:groupKey]
      },
      :body_object => {
        :email       => params[:email],
        :role        => params[:role]
      }
    }
    @@client.execute(request).data
  end

  def self.check params
    request = {
      :api_method => @@api.members.get,
      :parameters => {
        :groupKey   => params[:groupKey],
        :memberKey  => params[:memberKey]
      }
    }
    !@@client.execute(request).error?
  end

  def self.destroy params
    request = {
      :api_method => @@api.members.delete,
      :parameters => {
        :groupKey   => params[:groupKey],
        :memberKey  => params[:memberKey]
      }
    }
    @@client.execute(request).data
  end

end
