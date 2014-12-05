describe Relational::HasManyThrough do
  let(:role_name) { 'admin' }
  let(:role) { Role.create(name: role_name) }
  let(:user) { User.create(name: 'Blurb') }

  before do
    user.roles << role
  end

  it 'has roles' do
    expect(user.roles.first.name).to eq 'admin'
  end

  # Following a convention of naming the join table
  # using the resource you want to have_many of as the
  # first part of the name will not require only the
  # join table name to build the has_many relationship
  #
  context 'when following a convention' do
    let(:role_name) { 'guest' }

    before do
      class User < ActiveRecord::Base
        has_many_through :roles_users
      end
    end

    it 'assigns name' do
      expect(user.roles.first.name).to eq role_name
    end
  end
end
