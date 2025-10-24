class RoutinesController < ApplicationController
  def index
    @routines = Routine.all
  end

  def show
    @routine = Routine.find(params[:id])
    @assignments = @routine.assignments.includes(:exercise).order(:created_at)
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    if @routine.save
      redirect_to @routine, notice: "Routine created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @routine = Routine.find(params[:id])
    @routine.destroy
    redirect_to routines_path, notice: "Routine deleted."
  end


  private
  def routine_params
    ids = params.dig(:routine, :exercise_ids)&.reject(&:blank?)
    params[:routine][:exercise_ids] = ids if ids
    params.require(:routine).permit(:name, :photo, exercise_ids: [])
  end
end
