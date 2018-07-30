class DosesController < ApplicationController
  before_action :find_dose, only: [ :edit, :destroy, :update, :show ]

  def index
    @doses = Dose.all
  end

  def edit
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new()
  end

  def destroy
    @dose.destroy
  end

  def update
    if @dose.update(dose_params)
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
     params.require(:dose).permit(:description, :ingredient_id)
  end
end
