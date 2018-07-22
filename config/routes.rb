Slop::Application.routes.draw do
  
  resources :ebvs

  resources :mediciones

  resources :mediciontipos

  resources :catfiscales

  resources :cotizaciones

  resources :monedas

  resources :eventos

  resources :eventotipos

  resources :tareas

  resources :transacciontipos

  match '/transacciones/filtrosinforme' => 'transacciones#filtrosinforme', via: [:get]
  get '/transacciones/informe', to: 'transacciones#informe', :as => :transacciones_informe
  post '/transaccion/dibujaPantalla', to: 'transacciones#dibujaPantalla', :as => :dibujapantalla_transaccion
  get '/transacciones/cerrar', to: 'transacciones#cerrar', :as => :transacciones_cerrar
  post '/transacciones/aplicar', to: 'transacciones#aplicaCuotasRemoto'
	resources :transacciones

 

 
  match '/cuotas/importe' => 'cuotas#importe', via: [:post]
  match '/cuotas/buscaCuotas' => 'cuotas#buscaCuotas', via: [:post]
  resources :cuotas

	get '/eerr', to: 'asientos#eerr', :as => :eerr
  get '/cashflow', to: 'asientos#cashflow', :as => :cashflow_asiento
  match '/asientos/index' => 'asientos#index', via: [:get]
  resources :asientos


 
  resources :cuentas do
  	post 'importar', on: :collection
  	#  	collection {post :importar} otra alternativa es nombrarlo asi
  end	
  match '/cuentas/filtraPorTipos' => 'cuentas#filtraPorTipos', via: [:post]
 
  resources :empresas

  resources :establecimientos

  resources :tipo_accs


  resources :movimientos do
		post 'sel', :on => :collection
		resources :movorigen  
	end


  resources :categories


  resources :cat_tipos


  resources :animals


  resources :estados


  resources :rodeos
  	
  
  resources :users


  get '/sessions/cambioEst/:establecimiento_id', to: 'sessions#cambioEst', :as => :cambioEst
  get '/sessions/cambioEmp/:empresa_id', to: 'sessions#cambioEmp', :as => :cambioEmp
  get 'logout', to: 'sessions#logout', :as => :logout
  
  resources :sessions

  resources :tipo_accs

  resources :existencias

  match '/planilla_mensuals/consulta' => 'planilla_mensuals#consulta', via: :all, :as => :planilla_consulta
  resources :planilla_mensuals 


# The priority is based upon order of creation:
# first created -> highest priority.

# Sample of regular route:
#   match 'products/:id' => 'catalog#view'
# Keep in mind you can assign values other than :controller and :action

# Sample of named route:
#   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
# This route can be invoked with purchase_url(:id => product.id)

# Sample resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Sample resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Sample resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Sample resource route with more complex sub-resources
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', :on => :collection
#     end
#   end

# Sample resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end

# You can have the root of your site routed with "root"
# just remember to delete public/index.html.
root :to => 'bienvenidos#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
