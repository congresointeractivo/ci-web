module PoliticalPartiesHelper
  
  def calculate_legislator_path(legislator)
    if @political_party.type == "DIPUTADOS"
      diputado_path(legislator)  
    else
      senator_path(legislator)  
    end
  end
  
end
