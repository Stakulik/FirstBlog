class StaticPagesController < ApplicationController
  def home
  end

  def articles
  	@articles = Article.all
  end

  def about
  end
end
