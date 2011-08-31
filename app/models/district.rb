class District < ActiveRecord::Base
  set_table_name 'District'
  
  has_many :mandatos
  has_many :legisladors, :through => :mandatos
  
  # scope :for_senator, joins(:mandatos).joins(:political_party).where(PoliticalParty.type = 'SENADORES')
  # scope :for_diputado, joins(:mandatos).joins(:political_party).where(PoliticalParty.type = 'DIPUTADOS')
  
  def senators
    self.legisladors.senators
  end
  
  def diputados
    self.legisladors.diputados
  end
  
  def to_s
    self.name
  end
  
end