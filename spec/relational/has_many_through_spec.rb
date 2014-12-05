describe Relational::HasManyThrough do

  let(:role_name) { 'admin' }
  let(:role) { Role.create(name: role_name) }
  let(:user) { User.create(name: 'Blurb') }

  describe '.has_many_through' do
    before do
      User.send(:has_many_through, :roles, :roles_users)
      user.roles << role
    end

    it 'has_many roles' do
      expect(user.roles.first.name).to eq 'admin'
    end
  end

  # Following a convention of naming the join table
  # using the resource you want to have_many of as the
  # first part of the name will require only the
  # join table name to build the has_many relationship
  #
  context 'when following a convention' do
    let(:role_name) { 'guest' }

    before do
      User.send(:has_many_through, :roles_users)
      user.roles << role
    end

    it 'has_many roles' do
      expect(user.roles.first.name).to eq role_name
    end
  end

  describe '.hmt' do
    let(:role_name) { 'super' }

    before do
      User.send(:hmt, :roles_users)
      user.roles << role
    end

    it 'has_many roles' do
      expect(user.roles.first.name).to eq role_name
    end
  end

  context 'when no strategy is found' do
    it 'raises RelationalStrategyNotFoundError' do
      expect { User.send(:hmt) }.to raise_error { Relational::Strategies::NotFound }
    end
  end
end
