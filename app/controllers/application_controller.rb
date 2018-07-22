class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :current_user
	def current_user
		if session[:user_id] == nil 
			redirect_to new_session_path
		else 				
			@current_user ||= User.find(session[:user_id]) 
			@estDisp = @current_user.establecimientos.where("permiso = 1")
			@empDisp = @current_user.empresas.where("permiso = 1")
			estSessionValido = @current_user.establecimientos.where("permiso = 1 and establecimiento_id= #{session[:establecimiento_id]}").empty? unless !session[:establecimiento_id] 
			empSessionValido = @current_user.empresas.where("permiso = 1 and empresa_id= #{session[:empresa_id]}").empty? unless !session[:empresa_id]
			if(estSessionValido || !session[:establecimiento_id])  
				if(!@estDisp.empty?)
					if @estDisp.collect(&:id).include?(@current_user.ult_est)
						session[:establecimiento_id] = @current_user.ult_est							
					else 
						session[:establecimiento_id] = @estDisp.first.id							
						@current_user.update_attributes(:ult_est => session[:establecimiento_id])
					end
					@current_est = Establecimiento.find(session[:establecimiento_id])
				end
			else
				@current_est = Establecimiento.find(session[:establecimiento_id])
			end
			if(empSessionValido || !session[:empresa_id]) 
				if(!@empDisp.empty?)
					if @empDisp.collect(&:id).include?(@current_user.ult_emp)
						session[:empresa_id] = @current_user.ult_emp							
					else
						session[:empresa_id] = @empDisp.first.id							
						@current_user.update_attributes(:ult_emp => session[:empresa_id])
					end
					@current_emp = Empresa.find(session[:empresa_id])
				end
			else 
				@current_emp = Empresa.find(session[:empresa_id])
			end
		end
	end	
	helper_method :current_user
end
