class ArticlesController < ApplicationController

  before_action :find_id, only:[:show, :edit, :update, :destroy]

  before_action :authenticate_admin!, except:[:index]

  def index
    @articles = Article.all
    @titulo = "Articulos"
  end

  def show
    
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_strong)
    @article.user_id = current_admin.id 
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end    
  end

  def edit
    
  end

  def update
    if @article.update(params_strong)
      redirect_to article_path(@article)
      flash[:notice_success] = "Se ha actualizado el articulo con el titulo #{@article.title}"
    else
      render 'edit'
      flash[:notice_warning] = "No se ha podido actualizar"
    end  
  end

  def destroy
    if @article.destroy
      redirect_to root_path
      flash[:notice_success] = "Ha eliminado el articulo con el titulo: #{@article.title}"
    else
      render 'index'
    end     
  end

  private

  def params_strong
    params.require(:article).permit(:title, :text)
  end

  def find_id
    @article = Article.find(params[:id])
  end

end
