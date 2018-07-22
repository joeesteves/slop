class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  # GET /eventos
  def index
    @eventos = Evento.estActual(session[:establecimiento_id])
  end

  # GET /eventos/1
  def show
  end

  # GET /eventos/new
	def new
    @evento = Evento.new
		@evento.fecha = Date.today()
  end

  # GET /eventos/1/edit
  def edit
  end

  # POST /eventos
  def create
    @evento = Evento.new(evento_params)
		@evento.establecimiento_id = @current_est.id
    
		if @evento.save
      redirect_to @evento, notice: 'Evento was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /eventos/1
  def update
    if @evento.update(evento_params)
      redirect_to @evento, notice: 'Evento was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /eventos/1
  def destroy
    @evento.destroy
    redirect_to eventos_url, notice: 'Evento was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def evento_params
      params.require(:evento).permit(:fecha, :registro, :establecimiento_id, :desc, :eventotipo_id)
    end
end
