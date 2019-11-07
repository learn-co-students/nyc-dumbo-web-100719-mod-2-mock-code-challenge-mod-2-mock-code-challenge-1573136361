class SignupsController < ApplicationController
  def new
    # model?
    @signup = Signup.new
    @campers = Camper.all
    @activities = Activity.all

    # render :new
  end

  def create
    @signup = Signup.create(signup_params)
    # @signup = Signup.new(signup_params)
    # @signup.save

    if @signup.valid?
      redirect_to @signup.camper
    else
      flash[:errors] = @signup.errors.full_messages
      redirect_to new_signup_path
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:camper_id, :activity_id, :time)
  end
end
