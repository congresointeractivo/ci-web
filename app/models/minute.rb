class Minute < ActiveRecord::Base
  set_table_name 'Minute'
  
  belongs_to :reunion
end