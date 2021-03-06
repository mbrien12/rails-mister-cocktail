class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = Dose.where(cocktail: set_cocktail)
    @dose = Dose.new
    @ingredients = Ingredient.order(:name).all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
        format.json { render :show, status: :created, location: @cocktail }
      else
        format.html { render :new }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end


  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
     params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end
end
