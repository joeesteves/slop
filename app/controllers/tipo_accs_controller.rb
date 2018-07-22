class TipoAccsController < ApplicationController
  # GET /tipo_accs
  # GET /tipo_accs.json
  def index
    @tipo_accs = TipoAcc.order('codigo, nombre')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_accs }
    end
  end

  # GET /tipo_accs/1
  # GET /tipo_accs/1.json
  def show
    @tipo_acc = TipoAcc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_acc }
    end
  end

  # GET /tipo_accs/new
  # GET /tipo_accs/new.json
  def new
    @tipo_acc = TipoAcc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_acc }
    end
  end

  # GET /tipo_accs/1/edit
  def edit
    @tipo_acc = TipoAcc.find(params[:id])
    @selDif = @tipo_acc.estado_accions.where(:codigo =>3).collect(&:estado_id)
   	@selOri =  @tipo_acc.estado_accions.where(:codigo =>1).collect(&:estado_id) + @selDif
   	@selDest = @tipo_acc.estado_accions.where(:codigo =>2).collect(&:estado_id) + @selDif
 
  end

  # POST /tipo_accs
  # POST /tipo_accs.json
  def create
    @tipo_acc = TipoAcc.new(params[:tipo_acc])
	 	@sel = @tipo_acc.estado_accions.where(:codigo =>0).collect(&:id)
	 	$op = 0
	 	
		if params[:estados_dest] && !params[:estados_ori]
			@estadosDest = params[:estados_dest] 
			@estadosAll = @estadosDest
			$op = 1	
		end
		if params[:estados_dest] && params[:estados_ori]
			@estadosDif = params[:estados_ori] & params[:estados_dest]					
			@estadosDest = params[:estados_dest] - @estadosDif
			@estadosOri = params[:estados_ori] - @estadosDif
			@estadosAll = @estadosDest + @estadosOri + @estadosDif
			$op = 2
		end
		
    respond_to do |format|
      if @tipo_acc.save
      	if $op != 0
         @tipo_acc.update_attributes(:estado_ids => @estadosAll)
         
      	if $op == 1 
      		@tipo_acc.estado_accions.each do |e|
						 e.update_attributes(:codigo=>2)
					end	 
      	else
         @tipo_acc.estado_accions.each do |e|

					if @estadosOri.include? (e.estado_id.to_s)
	         	e.update_attributes(:codigo=>1)
  				elsif @estadosDest.include? (e.estado_id.to_s)       	
         	  e.update_attributes(:codigo=>2)
         	else
         	  e.update_attributes(:codigo=>3)
         	end  
				end # end del if $op
			end # end del if $op != 0
		end						
  
       
        format.html { redirect_to tipo_accs_path, notice: 'SE HAN GUARDADO LOS CAMBIOS' }
        format.json { render json: @tipo_acc, status: :created, location: @tipo_acc }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_acc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_accs/1
  # PUT /tipo_accs/1.json
  def update
    @tipo_acc = TipoAcc.find(params[:id])
		$op = 0
	 	
		if params[:estados_dest] && !params[:estados_ori]
			@estadosDest = params[:estados_dest] 
			@estadosAll = @estadosDest
			$op = 1	
		end
		
		if params[:estados_dest] && params[:estados_ori]
			@estadosDif = params[:estados_ori] & params[:estados_dest]					
			@estadosDest = params[:estados_dest] - @estadosDif
			@estadosOri = params[:estados_ori] - @estadosDif
			@estadosAll = @estadosDest + @estadosOri + @estadosDif
			$op = 2
		end
    respond_to do |format|
      if @tipo_acc.update_attributes(params[:tipo_acc])
         	if $op != 0
         		@tipo_acc.update_attributes(:estado_ids => @estadosAll)
         
      	if $op == 1 
      		@tipo_acc.estado_accions.each do |e|
						 e.update_attributes(:codigo=>2)
					end	 
      	else
         @tipo_acc.estado_accions.each do |e|

					if @estadosOri.include? (e.estado_id.to_s)
	         	e.update_attributes(:codigo=>1)
  				elsif @estadosDest.include? (e.estado_id.to_s)       	
         	  e.update_attributes(:codigo=>2)
         	else
         	  e.update_attributes(:codigo=>3)
         	end  
				end # end del if $op
			end # end del if $op != 0
       
       end
        format.html { redirect_to tipo_accs_path, notice: 'SE HAN ACTUALIZADO LOS CAMBIOS' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_acc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_accs/1
  # DELETE /tipo_accs/1.json
  def destroy
    @tipo_acc = TipoAcc.find(params[:id])
    @tipo_acc.destroy

    respond_to do |format|
      format.html { redirect_to tipo_accs_url }
      format.json { head :no_content }
    end
  end
end
