class EventotiposController < ApplicationController
  before_action :set_eventotipo, only: [:show, :edit, :update, :destroy]

  # GET /eventotipos
  def index
    @eventotipos = Eventotipo.all
  end

  # GET /eventotipos/1
  def show
  end

  # GET /eventotipos/new
  def new
    @eventotipo = Eventotipo.new
  end

  # GET /eventotipos/1/edit
  def edit
  end

  # POST /eventotipos
  def create
    @eventotipo = Eventotipo.new(eventotipo_params)

    if @eventotipo.save
      redirect_to @eventotipo, notice: 'Eventotipo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /eventotipos/1
  def update
    if @eventotipo.update(eventotipo_params)
      redirect_to @eventotipo, notice: 'Eventotipo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /eventotipos/1
  def destroy
    @eventotipo.destroy
    redirect_to eventotipos_url, notice: 'Eventotipo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventotipo
      @eventotipo = Eventotipo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def eventotipo_params
      params.require(:eventotipo).permit(:codigo, :nombre, :unidad, :desc)
    end
end
