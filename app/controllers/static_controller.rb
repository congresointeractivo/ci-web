class StaticController < ApplicationController
  def quienes_somos
    
  end
  
  def home
    @projects_count = Project.count
    @diputados_count = Diputado.count
    @senadores_count = Senator.count
    @present_percentage = Legislador.total_present_percentage
    @negative_votes_percentage = Vote.negative_percentage
    @positive_votes_percentage = Vote.positive_percentage
  end
end