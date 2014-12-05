class User < ActiveRecord::Base
  has_many_through :roles, :roles_users
end
