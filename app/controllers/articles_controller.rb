class ArticlesController < ApplicationController
  def index
    @articles = Article.all.reverse
  end

  def show
    @article = Article.find params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render "new"
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy

    redirect_to root_path
  end

  def like
    @article = Article.find params[:id]
    if @article.likes.where(user_id: current_user.id).present?
      like = @article.likes.where(user_id: current_user.id).first
      like.destroy
    else
      like = @article.likes.new
      like.user_id = current_user.id
      like.save
    end

    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image)
  end
end