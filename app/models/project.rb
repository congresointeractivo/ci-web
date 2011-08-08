class Project < ActiveRecord::Base
  belongs_to :minute
  set_table_name 'Project'
  
  has_and_belongs_to_many :votes, :foreign_key => 'Project_id', :join_table => 'Project_Vote', :association_foreign_key => 'voters_id'  
end