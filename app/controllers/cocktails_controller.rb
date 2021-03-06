class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [ :edit, :destroy, :update, :show ]
  #layout "home", only: [:index]

  def index
    @cocktails = Cocktail.all
    @title = "Mister Cocktail"
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
    @dose = Dose.new
  end

  def search
    @cocktails = Cocktail.search(params[:cocktail][:search])
    @title = "Search for: #{params[:cocktail][:search]}"
    render :index
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
     params.require(:cocktail).permit(:name, :image)
  end
end
