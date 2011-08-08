class District < ActiveRecord::Base
  set_table_name 'District'
  
  has_many :mandatos
  
end