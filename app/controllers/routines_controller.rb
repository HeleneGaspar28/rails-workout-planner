class RoutinesController < ApplicationController
  def index
    @routines = Routine.all
  end

  def show
    @routine = Routine.find(params[:id])
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    if @routine.save
      redirect_to @routine
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
  def routine_params
    params.require(:routine).permit(:name)
  end
end
