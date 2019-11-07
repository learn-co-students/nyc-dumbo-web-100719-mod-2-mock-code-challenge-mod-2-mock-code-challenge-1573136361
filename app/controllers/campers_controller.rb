class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def show
    @camper = Camper.find(params[:id])
    @activities = @camper.activities
  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    @camper.save

    redirect_to @camper
  end

  private

  def camper_params
    params.require(:camper).permit(:name, :age)
  end
end
