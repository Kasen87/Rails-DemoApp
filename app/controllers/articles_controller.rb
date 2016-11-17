class ArticlesController < ApplicationController
	#default public methods-- 
	#index, show, new, edit, create, update, and destroy
	
	#basic user authentication process
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	#Queries the DB for all resources of this type and serves them to requester
	def index
		@articles = Article.all
	end

	#Queries the DB for a single resource of this type and serves it to requester
	def show
		@article = Article.find(params[:id])
	end

	#Allows the user to begin the procedure of creating a new resource object
	def new
		@article = Article.new
	end

	#Allows the user to begin the procedure of updating a valid resource object
	def edit
		@article = Article.find(params[:id])
	end

	#Create a new entry in the article resoruce database 
	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	#Update an entry in the article resource database
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		#Validate the data coming in to make sure the title !empty and >5 char
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
