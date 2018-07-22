class UsersController < ApplicationController
  skip_before_filter :current_user, :only => [:create, :new]
   def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
    
  end

  # GET /rodeos/1
  # GET /rodeos/1.json
  
	
	def new
		@user = User.new
		@estDisponibles = @user.establecimientos
		@empDisponibles = @user.establecimientos
			
	end
	
	def edit
    
    @user = User.find(params[:id])
    
 		
 		@sel = @user.establecimientos.where("permiso = 1").collect(&:id)
		@estDisponibles = @user.establecimientos
 		
 		@empSel = @user.empresas.where("permiso = 1").collect(&:id)
		@empDisponibles = @user.empresas
 
 		
 	end

	
	def create
		@user = User.new(params[:user])
		
		if @user.save

				
			redirect_to users_path, :notice => "Usuario creado correctamente"
		else
			render "new"
			
		end
	
	end
	
	 def update
	 
    @user = User.find(params[:id])
   	@borrarPerm = @user.permisos
 			@borrarPerm.each do |p|
	 			p.update_attributes(:permiso => 0)
			end	
    		
    		@perm = @user.permisos.where("establecimiento_id IN (?)",  params[:permisos])
    
   	
   			@perm.each do |p|
   				p.update_attributes(:permiso => 1)
   			end	
   			
   			@empPerm = @user.permisos.where("empresa_id IN (?)",  params[:empPermisos])
    
   	
   			@empPerm.each do |p|
   				p.update_attributes(:permiso => 1)
   			end	
   			
   			
    respond_to do |format|

      if @user.save
	      @user.update_attributes(params[:user])
        format.html { redirect_to users_path, notice: 'Users tipo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_user_path(@user)}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
		  format.html { redirect_to users_url }
		  format.json { head :no_content }
		end
	  end


end
