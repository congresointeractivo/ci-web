class ProjectElement < ActiveRecord::Base
  set_table_name 'Project_elements'
  belongs_to :project
end