class Reunion < ActiveRecord::Base
  set_table_name 'Reunion'  
  
  belongs_to :session
end