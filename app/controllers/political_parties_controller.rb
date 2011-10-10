class PoliticalPartiesController < ApplicationController
  # GET /political_parties
  # GET /political_parties.xml
  def index
    @political_parties = PoliticalParty.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @political_parties }
    end
  end

  # GET /political_parties/1
  # GET /political_parties/1.xml
  def show
    @political_party = PoliticalParty.find(params[:id])
    @miembros = @political_party.miembros.paginate :page => params[:page], :per_page => 50

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @political_party }
    end
  end

end
