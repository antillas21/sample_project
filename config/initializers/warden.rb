Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find( id )
end

Warden::Strategies.add :password do
  def valid?
    params['user'].present?
  end

  def authenticate!
    user = User.find_by_email(params['user']['email'] )
    if user && user.authenticate( params['user']['password'] )
      success!( user )
    else
      fail!
    end
  end
end
