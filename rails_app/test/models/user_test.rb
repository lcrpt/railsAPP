require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = Users.new(name: "Exemple User", email: "user@exemple.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be to long" do
    @user.name = "a" * 50
    assert_not @user.valid?
  end
  
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
end
