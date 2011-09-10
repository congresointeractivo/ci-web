class Vote < ActiveRecord::Base
  set_table_name 'Vote'
  
  belongs_to :legislador
  has_and_belongs_to_many :projects, :join_table => "Project_Vote", :foreign_key => 'voters_id'
  delegate :partido, :to => :legislador
  ABSENT_KEY = "ABSENT"
  ABSTENTION_KEY = "ABSTENTION"
  AFIRMATIVE_KEY = "AFIRMATIVE"
  NEGATIVE_KEY = "NEGATIVE"
  
  def project
    self.projects.first
  end
  
  def self.positive_percentage
    total = vote_types_hash.values.inject(0){|sum, item| sum + item}
    positive = vote_types_hash[AFIRMATIVE_KEY] 
    ((positive.to_f / total) * 100).round(2)
  end
  
  def self.negative_percentage
    total = vote_types_hash.values.inject(0){|sum, item| sum + item}
    negative = vote_types_hash[NEGATIVE_KEY] 
    ((negative.to_f / total) * 100).round(2)
  end
  
  protected
  
  def self.vote_types_hash
    hash = {}
    ActiveRecord::Base.connection.execute("select voteType, count(*) from Vote group by voteType").map {|x| hash[x[0]] = x[1] }
    hash
  end
end