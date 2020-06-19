require 'rails_helper'

RSpec.describe User, :type => :model do
    let!(:user1) { User.create(username: 'test_user1') }
    let!(:user2) { User.create(username: 'test_user2') }
    let!(:user3) { User.create(username: 'test_user3') }

    context "Check for validation of user input" do
      # it "orders them in reverse chronologically" do
      #   puts "Hilla"
      #   # post = Post.create!
      #   # comment1 = post.comments.create!(:body => "first comment")
      #   # comment2 = post.comments.create!(:body => "second comment")
      #   expect(post.reload.comments).to eq([comment2, comment1])
      # end

      it "is valid with valid attributes" do
        expect(User.create).to_not be_valid
      end

      it "is not valid without a username" do
        # let!(:user_u) { User.create(username: nil) }
        expect(User.new(username: nil)).to_not be_valid
      end
    end
  
    # it "new user has no friendships" do
    #   # expect(user1.friendships.length).to eq 0
    # end
  
    # it "can add another user as a friend" do
    #   # user2 = User.create(email: 'test_user2@example.com', password: 'testtest', password_confirmation: 'testtest')
    #   # user1.request_friendship(friend: user2)
    #   # expect(user1.friendships.length).to eq 1
    # end
end
