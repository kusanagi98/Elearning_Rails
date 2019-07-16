class StudentsController < ApplicationController
  layout "student"
  before_action :logged_in_user, only: [:edit, :update]
   # check before edit and update if logged in or not
  before_action :correct_user,   only: [:edit, :update]
   # check before edit and update if correct user
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
  def edit
    @student = Student.find(params[:id])
  end
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @student
    else
      render 'edit'
    end
  end
  private

    def student_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation, :address, :dateofBirth, :budget, :avatar, :remove_avatar)
    end
    # Before filters

    # Confirms the correct user.
    def correct_user
      @student = Student.find(params[:id])
      redirect_to elearning_index_path unless current_user?(@student)
    end
end
