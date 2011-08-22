class Politician < ActiveRecord::Base
  set_table_name 'Politician'  
  
  # Calcula el porcentaje de presencia usando los contadores
  # de estado durante las sesiones
  def present_percentage
    total = countPresent.to_i + countAbsence.to_i + countLicense.to_i + countOfficialMission.to_i
    if countPresent.to_i == 0
      0.0
    else
      countPresent.to_f / total      
    end
  end
  
  def to_param
    "#{id}-#{full_name.gsub(/[^a-z0-9]+/i, '-')}"
  end
  
  def full_name
    "#{self.lastName}, #{politician.name}"
  end  
end
