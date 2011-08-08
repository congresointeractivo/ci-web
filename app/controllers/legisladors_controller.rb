class LegisladorsController < ApplicationController
  # GET /senators/1
  # GET /senators/1.xml
  def show
    @senator = Senator.find(params[:id])
    
    if @senator
      redirect_to senator_path(@senator)
    else
      @diputado = Diputado.find(params[:id])
      redirect_to diputado_path(@senator)
    end
  end
end
