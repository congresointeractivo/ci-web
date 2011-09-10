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
  
  # regla de tres simple
  # si total es 100%
  # cuanto es el porcentaje
  # de presentismo
  def self.total_present_percentage
    array = self.attendance_array
    present = array[0]
    non_present = array[1] + array[2] + array[3]
    total = present + non_present
    ((present.to_f / total) * 100).round(2)
  end
  
  protected
  
  # consulta SQL para hacer cuentas de presentismo en la tabla de Legislador
  def self.attendance_array
    ActiveRecord::Base.connection.execute("SELECT SUM(countPresent), SUM(countAbsence), SUM(countLicense), 
      SUM(countOfficialMission) FROM Legislador").map do |row| 
      [row[0].to_i, row[1].to_i, row[2].to_i, row[3].to_i] 
    end.flatten
  end
  
end