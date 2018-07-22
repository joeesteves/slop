class SessionsController < ApplicationController
  skip_before_filter :current_user, :only => [:create, :destroy, :new]
	skip_before_filter :verify_authenticity_token, :only => [:cambioEst, :cambioEmp]
	
	def new
	end
	
	def create
		user = User.find_by_usuario(params[:usuario])
		
		if user && user.authenticate(params[:password])
			session[:user_id]= user.id
			redirect_to root_url
		
		else
		
			flash.now.alert = "Datos incorrectos"
			render "new"
		end

	end
		
	def cambioEst
		session[:establecimiento_id] = params[:establecimiento_id]
		@current_user.update_attributes(:ult_est => params[:establecimiento_id])

		respond_to do |format|
      format.js {}
		end
		
	end
	
	def cambioEmp
		session[:empresa_id] = params[:empresa_id]
		@current_user.update_attributes(:ult_emp => params[:empresa_id])

		respond_to do |format|
      format.js {}
		end
		
	end
		
	def logout
		
			session[:user_id] = nil
			session[:establecimiento_id] = nil
			redirect_to root_url, :notice => "Sesion Cerrada"
	end

end
