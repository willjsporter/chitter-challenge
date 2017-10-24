require 'data_mapper'
require 'dm-migrations'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :peep_text,  Text
  property :user,       String
  property :posttime,   String

end
