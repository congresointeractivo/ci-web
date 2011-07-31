class PoliticiansController < ApplicationController
  # GET /politicians
  # GET /politicians.xml
  def index
    @politicians = Politician.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @politicians }
    end
  end

  # GET /politicians/1
  # GET /politicians/1.xml
  def show
    @politician = Politician.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @politician }
    end
  end

end
