class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect # shows it like a JSON object
		@article = Article.new(article_params) # Remember we have to whitelist our params, that can be done and re-used in the private section
		# @article.save # DONT NEED THIS ANYMORE, WEIRD THO!!!

		# redirect_to article_path(@article) # This redirects the user to the show action of the article after creating a new article

		if @article.save
			flash[:notice] = "Article was successfully created!"
			redirect_to article_path(@article)
		else
			render 'new' # or it can be --> :new
		end

	end

	def show
		@article = Article.find(params[:id])
	end

	private

	def article_params
		params.require(:article).permit(:title, :description) # THESE ARE STRONG PARAMS AND IS WHAT ALLOWS RAILS TO CREATE A NEW ARTICLE BECAUSE WE WHITE LIST THE PARAMS
	end

end