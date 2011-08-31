class DiputadosController < ApplicationController
  before_filter :setup_filters, :only => [:filter]
  before_filter :load_districts, :only => [:filter, :index]    
  
  # GET /diputados
  # GET /diputados.xml
  def index
    @distritos = District.all
    @bloques = PoliticalParty.where(:type => "DIPUTADOS").all    
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
    PoliticalParty.where(:type => "DIPUTADOS").all
  end
end
