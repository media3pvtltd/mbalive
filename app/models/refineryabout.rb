class Refineryabout < Refinery::Core::BaseModel
  self.table_name = 'refinery_abouts'
  has_many :abouts
end