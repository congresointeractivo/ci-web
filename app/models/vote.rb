class Vote < ActiveRecord::Base
  set_table_name 'Vote'
  
  belongs_to :legislador
  has_and_belongs_to_many :projects, :join_table => "Project_Vote", :foreign_key => 'voters_id'
  
  def project
    self.projects.first
  end
end