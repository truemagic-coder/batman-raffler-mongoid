class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :winner, type: Boolean
  # BUG: server side validations cause unrecoverable Batman state machine error
  # validates :name, :presence => true, :uniqueness => true
end
