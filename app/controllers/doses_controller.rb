class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/new'
    end
  end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
