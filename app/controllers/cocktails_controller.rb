class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:edit]

  def index
    @cocktails = Cocktail.all
  end

  def show
    set_cocktail
    @doses = @cocktail.doses.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    set_cocktail
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def edit
    @cocktail = set_cocktail
  end

  def update
    @cocktail = set_cocktail
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end
end
