require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'ghaidaa', email: 'ghada@mail.com')
  end

  test 'user mail' do
    assert_equal @user.email,'ghada@mail.com'
  end
end
