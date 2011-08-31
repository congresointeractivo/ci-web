class Mandato < ActiveRecord::Base
  set_table_name 'Mandato'
  
  belongs_to :political_party, :foreign_key => 'politicalParty_id'
  belongs_to :legislador
  has_one :senador, :through => :legislador
  has_one :diputado, :through => :legislador
  belongs_to :district
  
  scope :for_senator, joins(:political_party).where("PoliticalParty.type = 'SENADORES'")
  scope :for_diputado, joins(:political_party).where("PoliticalParty.type = 'DIPUTADOS'")
  
  def self.senator_districts
    Mandato.for_senator.map {|m| m.district }
  end
  
  def self.diputado_districts
    Mandato.for_diputado.map {|m| m.district }
  end
  
end