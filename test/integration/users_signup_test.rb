require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      user = { name:  "",
               email: "user@invalid",
               password:              "foo",
               password_confirmation: "bar" }
      post users_path, params: { user: user }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert.alert-danger'
    assert_select 'form[action="/signup"]'
  end
  
  test 'valid signup infomation' do
    get signup_path
    old_count = User.count
    user = { name: "Example User", 
             email: "example@user.com",
             password: "foobar",
             password_confirmation: "foobar"}
    post users_path, params: { user: user }
    new_count = User.count
    
    assert_equal old_count + 1, new_count
    follow_redirect!
    assert_select 'div.alert.alert-success'
    assert_template 'users/show'
  end
  
end
