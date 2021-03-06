class CocktailsController < ApplicationController

  before_action :find_cocktail, only: [ :show ]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_param)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktails_param
    params.require(:cocktail).permit(:name, :photo)
  end

end
