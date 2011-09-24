class DiputadosController < ApplicationController
  before_filter :setup_filters, :only => [:filter]
  before_filter :load_districts, :only => [:filter, :index]    
  helper_method :calculate_legislator_path
  helper_method :filter_action_path  
  
  # GET /diputados
  # GET /diputados.xml
  def index
    @distritos = District.all(:order => 'District.name ASC')
    @bloques = PoliticalParty.where(:type => "DIPUTADOS").all(:order => 'PoliticalParty.name ASC')    
    #@diputados = Diputado.all(:include => [:politician], :order => 'Politician.lastName ASC').paginate :page => params[:page], :per_page => 50
    @diputados = Diputado.all(:include => [:politician], :order => 'Politician.lastName ASC')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diputados }
    end
  end

  # GET /diputados/1
  # GET /diputados/1.xml
  def show
    @diputado = Diputado.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diputado }
    end
  end
  
  # GET /diputados/filtrar_por
  def filter
    if @filter[:bloques]
      @parties = PoliticalParty.get_parties(@filter[:bloques])
      
      if @parties.count > 1
        @diputados = Legislador.diputados.for_parties(@parties)
      else
        @diputados = Legislador.diputados.for_party(@parties.first)
      end
    elsif @filter[:distritos]
      @district = District.find_by_name(@filter[:distritos])
      @diputados = @district.diputados
    else
      @diputados = Legislador.diputados
    end

    #@diputados = sort_and_paginate_legislators(@diputados)

    render :action => 'index'
  end
  
  protected
  
  def load_political_parties
    PoliticalParty.where(:type => "DIPUTADOS").all(:order => 'PoliticalParty.name ASC')
  end
  
  def calculate_legislator_path(legislator)
    diputado_path(legislator)
  end
  
  def filter_action_path
    "/diputados/filtrar_por"
  end
  
end
