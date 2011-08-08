class Senator < Politician
  has_one :politician, :foreign_key => 'id'
  delegate :lastName, :name, :mail, :photoPath, :to => :politician

  has_one :legislador, :foreign_key => "id"
  delegate :summarizedCountSignedProjects, :countAbsence, :countAbsencePercentage, 
           :countLicense, :countLicensePercentage, :countOfficialMission, 
           :countOfficialMissionPercentage, :countPresent, :countPresentPercentage, 
           :absent, :abstention, :afirmative, :negative, :votes, :partido, :to => :legislador
           
  set_table_name 'Senador'
end