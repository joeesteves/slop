class TransacciontiposController < ApplicationController
  before_action :set_transacciontipo, only: [:show, :edit, :update, :destroy]

  # GET /transacciontipos
  def index
    @transacciontipos = Transacciontipo.all
  end

  # GET /transacciontipos/1
  def show
  end

  # GET /transacciontipos/new
  def new
    @transacciontipo = Transacciontipo.new
  end

  # GET /transacciontipos/1/edit
  def edit
  end

  # POST /transacciontipos
  def create
    @transacciontipo = Transacciontipo.new(transacciontipo_params)

    if @transacciontipo.save
      redirect_to @transacciontipo, notice: 'Transacciontipo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /transacciontipos/1
  def update
    if @transacciontipo.update(transacciontipo_params)
      redirect_to @transacciontipo, notice: 'Transacciontipo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /transacciontipos/1
  def destroy
    @transacciontipo.destroy
    redirect_to transacciontipos_url, notice: 'Transacciontipo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transacciontipo
      @transacciontipo = Transacciontipo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transacciontipo_params
      params.require(:transacciontipo).permit(:codigo, :nombre)
    end
end
