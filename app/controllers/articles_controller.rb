class  ArticlesController < ApplicationController 
	before_action :set_article, only: [:show]

	def index 
		@article = Article.all
	end 
	def new 
		@article = Article.new
	end

	def show
	end

	def edit
		@article = Article.find(params[:id])
	end



	def create 
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article, message: "Article has been created successfully"
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
	      redirect_to @article, notice: 'Post was successfully updated.'
	    else
	      render :edit
	    end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
	end



	private
		def article_params
			params.require(:article).permit(:title,:description) 
		end

	def set_article
		@article = Article.find(params[:id])
	end

end  