require 'peep'
require_relative '../models/datamapper_models'

describe Peep do
  it "Peep class can add peeps to database" do
    unit_peep = Peep.create(peep_text: "text", user: "user", posttime: Time.now)
    expect(Peep.last(posttime: Time.now)).to eq unit_peep
  end
end
