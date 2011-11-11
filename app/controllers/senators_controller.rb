class SenatorsController < ApplicationController
  before_filter :setup_filters, :only => [:filter]
  before_filter :load_districts, :only => [:filter, :index]
  helper_method :calculate_legislator_path
  helper_method :filter_action_path

  # GET /senators
  # GET /senators.xml
  def index
    @bloques = PoliticalParty.where(:type => "SENADORES").order("PoliticalParty.name ASC").all
    @senators = Senator.includes(:politician).order('Politician.lastName ASC').all
    @distritos = District.order('District.name ASC').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @senators }
    end
  end

  # GET /senators/filtrar_por
  def filter
    if @filter[:bloques]
      @parties = PoliticalParty.get_parties(@filter[:bloques])

      if @parties.count > 1
        @senators = Legislador.senators.for_parties(@parties)
      else
        @senators = Legislador.senators.for_party(@parties.first)
      end
    elsif @filter[:distritos]
      @district = District.find_by_name(@filter[:distritos])
      @senators = @district.senators
    else
      @senators = Legislador.senators
    end

    @senators = sort_and_paginate_legislators(@senators)

    render :action => 'index'
  end

  # GET /senators/1
  # GET /senators/1.xml
  def show
    @senator = Senator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @senator }
    end
  end

  protected

  def load_political_parties
    PoliticalParty.where(:type => "SENADORES").all(:order => 'PoliticalParty.name ASC')
  end

  def calculate_legislator_path(legislator)
    senator_path(legislator)
  end

  def filter_action_path
    "/senadores/filtrar_por"
  end

end
