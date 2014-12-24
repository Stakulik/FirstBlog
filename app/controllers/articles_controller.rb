class ArticlesController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :top_5, only: [:index, :show]


  def index
    if signed_in?
      @articles = Article.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    else
      @articles = Article.where(status: true).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
      @show_sidebar = true
    end
  end

  def show
    @article = Article.find(params[:id])
    @show_sidebar = true
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

  def public 
    @article = Article.find(params[:id])
    @article.toggle(:status)
  #  @article.update_attribute(:status, !@article.status)
    if @article.save
      #good
    else
      #bad
    end
    redirect_to :back
  end



  private

    def article_params
      params.require(:article).permit(:header, :content, :title, :seo_description, :seo_keywords, :status, :bootsy_image_gallery_id, :created_at)
    end

    def signed_in_user
      redirect_to about_path, notice: "Please sign in." unless signed_in?
    end

    def top_5
      @top_5 = Article.where(status: true)
    end




end
