require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "does not save user without a name" do
    user = User.new

    assert_not user.save, 'Saved the user without a name'
  end

  test "saves user with a name" do
    user = User.new(name: 'Jon Snow')

    assert user.save, 'Saved the user with a name'
  end
end
