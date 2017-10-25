def user_signup
  visit '/signup'
  fill_in('name', with: "Will Porter")
  fill_in('email', with: "will@chitter.com")
  fill_in('username', with: "will")
  fill_in('password', with: "password123")
  click_button("Sign up!")
end
