class ArticlesController < ApplicationController
  
  def index
    @article = Article.all
    @article = Article.paginate(page: params[:page], per_page: 3)

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_index_path
      flash[:notice] = "Article created successfully ?"
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    unless session[:user_id] == @article.id
       flash[:notice] = "You don't have access to that order!"
       redirect_to articles_path(session[:user_id])
       return
    end
  end

  def update
     @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_index_path
      flash[:notice] = "Article updated successfully "
    else
      render :edit
    end
  end

   def destroy
     @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_index_path
      flash[:notice] = "Article Destroyed ? "
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :avatar, :user_id)
  end
end
