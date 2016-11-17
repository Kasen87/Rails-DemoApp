class CommentsController < ApplicationController
	
	#Authentication Method
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
	#index, 
	
	#show, 

	#new, 

	#edit, 

	#create, 
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	#update, 
	
	#destroy
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	#private methods
	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end 

end
