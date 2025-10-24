class AssignmentController < ApplicationController
  before_action :set_routine, only: [:new, :create]

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.routine = @routine
    if assignment.save
      redirect_to @routine
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    assignment = Assignment.find(params[:id])
    routine = assigment.routine
    assigment.destroy
    redirect_to routine
  end

  private

  def assignment_params
    params.require(:assignment).permit(:exercise_id, :note, :sets, :reps)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end
end
