class PoliticalParty < ActiveRecord::Base
  set_table_name 'PoliticalParty'
  set_inheritance_column :party_type
  
  has_many :mandatos, :foreign_key => 'politicalParty_id'
  
  def miembros
    if self.type == 'DIPUTADOS'
      Diputado.find(self.legisladores.map(&:id))
    else
      Senator.find(self.legisladores.map(&:id))
    end
  end
  
  # returns all parties specified in a 
  # comma separated string. 
  # eg. get_parties('Partido Justicialista,UCR,Frente para la Victoria')
  def self.get_parties(parties_string)
    names = parties_string.split(',')
    
    if names.size > 1
      PoliticalParty.find(:all, :conditions => {:name => names})  
    else
      PoliticalParty.find(:all, :conditions => ['name = ?', names])  
    end
  end
  
  def to_s
    self.name
  end
end