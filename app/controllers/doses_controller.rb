class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail_id = @cocktail.id
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
