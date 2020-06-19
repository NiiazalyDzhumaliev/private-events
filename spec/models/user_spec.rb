require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Check for validation of user input' do
    it 'is valid with valid attributes' do
      expect(User.create).to_not be_valid
    end

    it 'is not valid without a username' do
      expect(User.new(username: nil)).to_not be_valid
    end
  end

  context 'ActiveRecord associations' do
    it 'has many events' do
      expect(User.reflect_on_association(:events).macro).to be: has_many
    end
  end
end
