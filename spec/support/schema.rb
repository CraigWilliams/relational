ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, force: true do |t|
    t.string :name
    t.string :email
  end

  create_table :roles, force: true do |t|
    t.string :name
  end

  create_table :roles_users, force: true do |t|
    t.references :user
    t.references :role
  end

end
