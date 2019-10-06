class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index  
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to cats_url, status: :not_found
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :edit
    else
      redirect_to cats_url, status: :not_found
    end
  end

  # For create, redirect_to so the URL path changes
  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end
  
  # For update, render is fine since URL is same with different HTTP method
  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat
      if @cat.update_attributes(cat_params)
        render :show
      else
        render :edit
      end
    else
      redirect_to cats_url, status: :not_found
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
