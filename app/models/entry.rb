class Entry
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name
  field :winner, type: Boolean
  validates :name, :presence => true, :uniqueness => true
  
  # use these two methods instead of overriding _id in batman
  # leads to better outcomes 
  def id
    self._id
  end
  
  def as_json(options={})
    options.merge!(:except => :_id, :methods => :id)
    super(options)
  end
  
end
