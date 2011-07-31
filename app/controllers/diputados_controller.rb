class DiputadosController < ApplicationController
  # GET /diputados
  # GET /diputados.xml
  def index
    @diputados = Diputado.all(:include => [:politician], :order => 'Politician.lastName ASC').paginate :page => params[:page], :per_page => 50

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
end
