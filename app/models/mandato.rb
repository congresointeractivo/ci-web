class Mandato < ActiveRecord::Base
  set_table_name 'Mandato'
  
  belongs_to :political_party, :foreign_key => 'politicalParty_id'
  belongs_to :legislador
  has_one :senador, :through => :legislador
  has_one :diputado, :through => :legislador
  belongs_to :district
  
end