class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [ :edit, :destroy, :update, :show ]

  def index
    @cocktails = Cocktail.all
  end

  def edit
  end

  def new
    @cocktail = Cocktail.new
  end

  def destroy
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
     params.require(:cocktail).permit(:name, :image)
  end
end
