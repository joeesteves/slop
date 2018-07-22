class EbvsController < ApplicationController
  before_action :set_ebv, only: [:show, :edit, :update, :destroy]

  # GET /ebvs
  def index
    @ebvs = Ebv.all
  end

  # GET /ebvs/1
  def show
  end

  # GET /ebvs/new
  def new
    @ebv = Ebv.new
  end

  # GET /ebvs/1/edit
  def edit
  end

  # POST /ebvs
  def create
    @ebv = Ebv.new(ebv_params)

    if @ebv.save
      redirect_to @ebv, notice: 'Ebv was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /ebvs/1
  def update
    if @ebv.update(ebv_params)
      redirect_to @ebv, notice: 'Ebv was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /ebvs/1
  def destroy
    @ebv.destroy
    redirect_to ebvs_url, notice: 'Ebv was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebv
      @ebv = Ebv.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ebv_params
      params.require(:ebv).permit(:fecha, :nacdird, :nacdirp, :nacmatd, :nacmatp, :dttdird, :dttdirp, :dttmatd, :dttmatp, :pasoad, :pesoap, :pesoaymd, :pesoaymp, :pesoadd, :pesoadp, :gdpd, :gdpp, :icad, :icap, :consumod, :consumop, :irfd, :irfp, :althd, :althp, :largod, :largop, :ctd, :ctp, :ced, :cep, :animal_id)
    end
end
