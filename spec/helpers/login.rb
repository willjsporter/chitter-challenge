def user_login
  visit '/'
  fill_in('username', with: "will")
  fill_in('password', with: "password123")
  click_button("Login")
end
