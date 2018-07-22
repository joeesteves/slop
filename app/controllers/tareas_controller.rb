class TareasController < ApplicationController
  before_action :set_tarea, only: [:show, :edit, :update, :destroy]

  # GET /tareas
  def index
    @tareas = Tarea.all
  end

  # GET /tareas/1
  def show
  end

  # GET /tareas/new
  def new
    @tarea = Tarea.new
    @tarea.fecha = Date.today
  end

  # GET /tareas/1/edit
  def edit
  end

  # POST /tareas
  def create
    @tarea = Tarea.new(tarea_params)
    @tarea.establecimiento_id = session[:establecimiento_id] 

    if @tarea.save
      redirect_to @tarea, notice: 'Tarea was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /tareas/1
  def update
    if @tarea.update(tarea_params)
      redirect_to @tarea, notice: 'Tarea was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /tareas/1
  def destroy
    @tarea.destroy
    redirect_to tareas_url, notice: 'Tarea was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarea
      @tarea = Tarea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tarea_params
      params.require(:tarea).permit(:fecha, :titulo, :desc, :estado, :establecimiento_id)
    end
end
