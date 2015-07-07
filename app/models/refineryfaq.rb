class Refineryfaq < Refinery::Core::BaseModel
  self.table_name = 'refinery_faqs'
  has_many :faqs
end