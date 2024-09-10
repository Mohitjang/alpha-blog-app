class  ArticlesController < ApplicationController 
	def new 
		@article = Article.new
	end


	def create 
		@article = Article.new(article_params)
		@article.save
		# redirect_to show_article_path(@article)
		redirect_to new_article_path
	end

	def show 
		@article = Article.find(article_params)
	end



	private
		def article_params
			params.require(:article).permit(:title,:description) 
		end

end 