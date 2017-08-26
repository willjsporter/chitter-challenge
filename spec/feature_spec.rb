require_relative '../app'
require 'helpers/input_peep.rb'

feature "posting peeps" do
  scenario "peeps can be posted to the site and take a username" do
    expect(Peep).to receive(:create)
    input_peep
    expect(page).to have_content("will sez\npeep content is this")
  end

  scenario "peeps can be viewed on the webpage" do

  end
end

feature "viewing links" do
  scenario "peeps are listed in reverse chronological order on the homepage" do

  end
end

feature "sign up for chitter" do
  scenario "there is a sign-up button for chitter on the homepage" do

  end

  scenario "the sign-up button takes users to a sign-up page" do

  end

  scenario "the sign-up page has fields for username, password and email" do

  end

  scenario "users are stored on a database" do

  end

end

feature "posts require a user to post" do
  scenario "expect an errorpage if the sign in is done without a username" do

  end
end
