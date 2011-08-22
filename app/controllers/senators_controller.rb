class SenatorsController < ApplicationController
  before_filter :setup_filters, :only => [:filter]
  
  # GET /senators
  # GET /senators.xml
  def index
    @bloques = PoliticalParty.where(:type => "SENADORES").all
    @senators = sort_and_paginate_legislators(Legislador.senators)

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
    PoliticalParty.where(:type => "SENADORES").all
  end
  
end
