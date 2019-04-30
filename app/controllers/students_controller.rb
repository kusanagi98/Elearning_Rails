class StudentsController < ApplicationController
  layout "student"
  def show
    @student = Student.find(params[:id]) #params hash include id action controller
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)    # params for Student, taken from html input
    if @student.save
      # Handle a successful save.
      log_in @student
      flash[:success] = "Welcome to the Elearning!"
      redirect_to @student
    else
      render 'new'
    end
  end
  private

    def student_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation, :address, :dateofBirth, :budget)
    end
end
