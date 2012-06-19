class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :winner, type: Boolean
  validates :name, :presence => true, :uniqueness => true
end
