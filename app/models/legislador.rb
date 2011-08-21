class Legislador < Politician
  set_table_name 'Legislador'
  
  has_one :politician, :foreign_key => 'id'
  delegate :lastName, :name, :mail, :photoPath, :to => :politician
  
  has_many :mandatos
  has_many :votes
  
  scope :diputados, joins("join Diputado on Legislador.id = Diputado.id")
  scope :senators, joins("join Senador on Legislador.id = Senador.id")
  scope :for_party, lambda {|party| joins(:mandatos).where('Mandato.politicalParty_id = ?', party.id)}
  scope :for_parties, lambda {|parties| joins(:mandatos).where('Mandato.politicalParty_id in (?)', parties)}
  
  # Busca el último mandato y devuelve el  partido
  def partido
    mandato = self.mandatos(:order => 'toMandato DESC').first
    
    mandato.political_party if mandato
  end
  
  def full_name
    "#{self.lastName}, #{politician.name}"
  end
end