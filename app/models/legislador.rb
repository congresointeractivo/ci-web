class Legislador < Politician
  set_table_name 'Legislador'
  
  has_one :politician, :foreign_key => 'id'
  delegate :lastName, :name, :mail, :photoPath, :to => :politician
  
  has_many :mandatos
  has_many :votes
  
  # Busca el último mandato y devuelve el  partido
  def partido
    mandato = self.mandatos(:order => 'toMandato DESC').first
    
    mandato.political_party if mandato
  end
  
  def full_name
    "#{self.lastName}, #{politician.name}"
  end
end