class ArticlesController < ApplicationController

	def new
		@article = Article.new
	end

	def create
		# render plain: params[:article].inspect # shows it like a JSON object
		@article = Article.new(article_params) # Remember we have to whitelist our params, that can be done and re-used in the private section
		@article.save
		redirect_to articles_show(@article)
	end

	private

	def article_params
		params.require(:article).permit(:title, :description)
	end

end