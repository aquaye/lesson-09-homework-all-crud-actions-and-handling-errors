class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to articles_path
    else
      flash.now[:error] = "An error occurred. Article could not be created."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article was updated successfully."
    else
      flash.now[:error] = "An error occurred. Article could not be updated."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
