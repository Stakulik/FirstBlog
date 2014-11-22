class ArticlesController < ApplicationController

  def index
#   @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 4)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Статья добавлена"
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy 
    Article.find(params[:id]).destroy
      redirect_to articles_path
  end


  private

    def article_params
      params.require(:article).permit(:title, :content, :status, :bootsy_image_gallery_id)
    end


end
