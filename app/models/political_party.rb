class PoliticalParty < ActiveRecord::Base
  set_table_name 'PoliticalParty'
  set_inheritance_column :party_type
  
  has_many :mandatos, :foreign_key => 'politicalParty_id'
  has_many :legisladores, :through => :mandatos, :source => :legislador
  
  
  def miembros
    if self.type == 'DIPUTADOS'
      Diputado.find(self.legisladores.map(&:id))
    else
      Senator.find(self.legisladores.map(&:id))
    end
  end
end