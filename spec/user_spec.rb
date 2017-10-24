require 'user'
require_relative '../models/datamapper_models'

describe User do
  it "User class can add users to database" do
    unit_user = User.create(name: "name", username: "username", email: "e@mail.com", password: "123")
    expect(User.last(email: "e@mail.com")).to eq unit_user
  end
end
