require_relative '../../app'
require_relative '../../models/peep'
require_relative '../../models/user'
require_relative '../helpers/input_peep.rb'
require 'pry'

# def input_peep(text="peep content is this")
#   visit '/'
#   fill_in('peep_text', with: text)
#   fill_in('username', with: "will") #this line will probably need to be removed later
#   click_button("Peep peep!!")
# end

feature "posting peeps" do
  scenario "peeps can be posted to the site and take a username" do
    expect(Peep).to receive(:create).with(peep_text: "peep content is this", user: "will", posttime: Time.now.strftime('%I:%M:%S %p'))
    input_peep
  end

  scenario "peeps can be viewed on the webpage" do
    # binding.pry
    input_peep
    expect(page).to have_content("will sez\npeep content is this")
    # save_and_open_page
  end
end

feature "viewing links" do
  scenario "peeps are listed in reverse chronological order on the homepage" do
    input_peep("peep1")
    input_peep("peep2")
    chitter_text = "will sez\npeep2\n @ #{Time.now}\nwill sez\npeep1\n @ #{Time.now}"
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
