require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(user_name: 'Alexander', user_lastname: 'Peredo', user_second_lastname: 'Torossova', user_email: 'john@example.com', user_gender: 'Masculino', user_birthdate: Date.new(1993,1,5), password: 'arsenal2012')
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.user_name = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without lastname' do
    @user.user_lastname = nil
    refute @user.valid?
    assert_not_nil @user.errors[:user_lastname]
  end

  test 'invalid without email' do
    @user.user_email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test 'invalid_email_format' do
    @user.user_email = "john@example.com"
    assert_match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, @user.user_email)
  end
end
