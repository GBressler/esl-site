class StaticPagesController < ApplicationController

	def home
		
	end
	
	def about
		
	end

	def policies
		
	end

	def show
		render params[:id]
	end
end
