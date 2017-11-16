class DosesController < ApplicationController
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])

     respond_to do |format|
      if @dose.save
        format.html { redirect_to @dose.cocktail, notice: 'Dose was successfully added to Cocktail.' }
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { redirect_to @dose.cocktail }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose.cocktail
  end


  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end 
end
