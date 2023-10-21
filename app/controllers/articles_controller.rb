class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    @vote = current_user.votes.find_by(article_id: @article.id) if current_user
  end

  def index
    @articles = Article.all
  end

  def new
    if current_user
      @article = Article.new
    else
      redirect_to signin_path
    end
  end

  def create
    @article = Article.new(article_params)
    @article.creator = current_user
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end
  private

  def article_params
    params.require(:article).permit(:title, :text, :image, :prix_max, :prix_min, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end