class ArticlesController < ApplicationController
	def new
		# Comment here
	end
	def create
		render plain: params[:article].inspect
	end
end
