class SenatorsController < ApplicationController
  # GET /senators
  # GET /senators.xml
  def index
    @senators = Senator.all(:include => [:politician], :order => 'Politician.lastName ASC').paginate :page => params[:page], :per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @senators }
    end
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
end
