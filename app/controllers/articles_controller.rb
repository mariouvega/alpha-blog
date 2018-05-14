class ArticlesController < ApplicationController
	# THIS CALLS THE METHOD FOR ALL THE SPECIFIED ACTIONS AND DOES T BEFORE ANY ACTION
	before_action :set_article, only: [:edit, :update, :show, :destroy]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new # THIS IS HANDLED BY THE CREATE ACTION
	end

	def edit
		 # THIS HANDLED BY THE UPDATE ACTION
	end

	def create
		# render plain: params[:article].inspect # shows it like a JSON object
		# @article.save # DONT NEED THIS ANYMORE, WEIRD THO!!!
		# redirect_to article_path(@article) # This redirects the user to the show action of the article after creating a new article

		@article = Article.new(article_params) # Remember we have to whitelist our params, that can be done and re-used in the private section

		if @article.save
			flash[:success] = "Article was successfully created!"
			redirect_to article_path(@article)
		else
			render 'new' # or it can be --> :new
		end

	end

	def show
		
	end

	def destroy
		
		@article.destroy

		flash[:danger] = "Article has been deleted"

		redirect_to articles_path
	end

	def update
		
		if @article.update(article_params)
			flash[:success] = "Article was updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	private

	def set_article
		# WE CREATED THIS BECAUSE IT WAS REPEATED CODE IN A FEW ACTIONS, SO WE MADE IT INTO A METHOD AND CALLED IT IN THE BEFORE_ACTION ON TOP
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description) # THESE ARE STRONG PARAMS AND IS WHAT ALLOWS RAILS TO CREATE A NEW ARTICLE BECAUSE WE WHITE LIST THE PARAMS
	end

end