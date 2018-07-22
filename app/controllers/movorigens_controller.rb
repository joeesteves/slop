class MovorigensController < ApplicationController
	def create
		@movorigen = Movorigen.new(params[:movorigen])
		@movorigen.save
	end
	
	

end
