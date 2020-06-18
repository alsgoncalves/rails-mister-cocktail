class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(doses_params)
    @dose = Dose.destroy
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
