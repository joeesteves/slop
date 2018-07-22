class CatTiposController < ApplicationController
  # GET /categorias_tipos
  # GET /categorias_tipos.json
  def index
    @categorias_tipos = CatTipo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categorias_tipos }
    end
  end

  # GET /categorias_tipos/1
  # GET /categorias_tipos/1.json
  def show
    @categorias_tipo = CatTipo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categorias_tipo }
    end
  end

  # GET /categorias_tipos/new
  # GET /categorias_tipos/new.json
  def new
    @categorias_tipo = CatTipo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categorias_tipo }
    end
  end

  # GET /categorias_tipos/1/edit
  def edit
  	
    @categorias_tipo = CatTipo.find(params[:id])
  	@sel = @categorias_tipo.tipo_acc_ids
 	@selEst = @categorias_tipo.estado_ids;
  
  end

  # POST /categorias_tipos
  # POST /categorias_tipos.json
  def create
    
    @categorias_tipo = CatTipo.new(params[:cat_tipo])

		respond_to do |format|
			if @categorias_tipo.save
      			categories = @categorias_tipo.update_attributes(:tipo_acc_ids =>params[:tipo_accs])
				@categorias_tipo.update_attributes(:estado_ids =>params[:estados])
				
			

        format.html { redirect_to cat_tipos_path, notice: 'OK' }
        format.json { render json: @categorias_tipo, status: :created, location: @categorias_tipo }
			else
        format.html { render action: "new" }
        format.json { render json: @categorias_tipo.errors, status: :unprocessable_entity }
    	end	
		end
	end

  # PUT /categorias_tipos/1
  # PUT /categorias_tipos/1.json
  def update
    @categorias_tipo = CatTipo.find(params[:id])

    respond_to do |format|
      if @categorias_tipo.update_attributes(params[:cat_tipo])
     		categories = @categorias_tipo.update_attributes(:tipo_acc_ids =>params[:tipo_accs])
				@categorias_tipo.update_attributes(:estado_ids =>params[:estados])
        format.html { redirect_to cat_tipos_path, notice: 'Categorias tipo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categorias_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorias_tipos/1
  # DELETE /categorias_tipos/1.json
  def destroy
    @categorias_tipo = CatTipo.find(params[:id])
    @categorias_tipo.destroy

    respond_to do |format|
      format.html { redirect_to cat_tipos_url }
      format.json { head :no_content }
    end
  end
 end
