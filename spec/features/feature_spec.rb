require_relative '../../app'
require_relative '../../models/peep'
require_relative '../../models/user'
require_relative '../helpers/input_peep'
require_relative '../helpers/signup'
require_relative '../helpers/login'
require 'pry'

# def input_peep(text="peep content is this")
#   visit '/'
#   fill_in('peep_text', with: text)
#   fill_in('username', with: "will") #this line will probably need to be removed later
#   click_button("Peep peep!!")
# end

feature "posting peeps" do
  scenario "peeps can be posted to the site and take a username" do
    expect(Peep).to receive(:create).with(peep_text: "peep content is this", user: "will", posttime: Time.now.strftime('%d/%m/%Y at %I:%M:%S %p'))
    input_peep
  end

  scenario "peeps can be viewed on the webpage" do
    # binding.pry
    input_peep
    expect(page).to have_content("will sez\n\"peep content is this\"")
    # save_and_open_page
  end
end

feature "viewing links" do
  scenario "peeps are listed in reverse chronological order on the homepage" do
    input_peep('peep1')
    input_peep('peep2')
    test_time = Time.now.strftime('%d/%m/%Y at %I:%M:%S %p')
    chitter_text = "will sez\n\"peep2\"\n @ #{test_time}\n\nwill sez\n\"peep1\"\n @ #{test_time}"
    expect(page).to have_content(chitter_text)
    p text
  end
end

feature "sign up for chitter" do
  scenario "there is a sign-up button for chitter on the homepage" do
    visit '/'
    expect(page).to have_selector("input[type=submit][value='Sign up for Chitter!']")
  end

  scenario "the sign-up button takes users to a sign-up page" do
    visit '/'
    click_button('Sign up for Chitter!')
    expect(page).to have_selector("input[type=text][name='name']")
    expect(page).to have_selector("input[type=text][name='username']")
    expect(page).to have_selector("input[type=email][name='email']")
    expect(page).to have_selector("input[type=password][name='password']")
  end

  # scenario "the sign-up page has fields for username, password and email" do
  #
  # end

  scenario "users are stored on a database" do
    # expect(User).to receive(:create).with(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    visit '/'
    click_button('Sign up for Chitter!')
    fill_in('name', with: "Test User")
    fill_in('email', with: "test@user.com")
    fill_in('username', with: "testuser")
    fill_in('password', with: "password")
    click_button("Sign up!")
    test_user = User.last(username: "testuser")
    expect(test_user.name).to eq "Test User"
    expect(test_user.username).to eq "testuser"
    expect(test_user.email).to eq "test@user.com"
    expect(test_user.password).to eq "password"

  end

end

feature "posts require a user to post" do
  scenario "expect an errorpage if the peep in is done without a username" do
    visit '/'
    fill_in('peep_text', with: "hello")
    expect { click_button("Peep peep!!") }.to(raise_error { "Username required" })
  end
end

feature "users can sign in to Chitter" do
  scenario "There is a form on the homepage for logging in" do
    visit '/'
    expect(page).to have_selector("input[type=text][name='username']")
    expect(page).to have_selector("input[type=password][name='password']")
    expect(page).to have_selector("input[type=submit][value='Login']")
  end

  scenario "After signin the user's name is displayed" do
    user_signup
    user_login
    expect(page).to have_content "Signed in as will"
  end

  scenario "After signin the form is not displayed" do
    user_signup
    user_login
    expect(page).not_to have_selector("input[type=text][name='username']")
    expect(page).not_to have_selector("input[type=password][name='password']")
  end

  scenario "signin fails if you do not input a valid username and password" do
    user_signup
    fill_in('username', with: "will")
    fill_in('password', with: "password1234")
    click_button("Login")
    expect(page).to have_content("NOT A VALID USERNAME OR PASSWORD")
  end

  # COULD HAVE:
  # 1) NOTHING (NIL)
  # 2) FAILED signin
  # 3)

end
