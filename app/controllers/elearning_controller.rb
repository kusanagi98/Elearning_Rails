class ElearningController < ApplicationController
    layout "student", only: [:new, :create, :edit]
    before_action :teacher_user, only: [:new, :create, :edit, :update, :destroy]
    def index
    end
    def show
        @course = Course.find(params[:id])
        @teacher = Student.find(@course[:student_id])
    end
    def new
        @course = current_user.courses.build
    end
    def create
        @course = current_user.courses.build(course_params)
        if @course.save
            flash[:success] = "Course created!"
            redirect_to elearning_index_path
        else
            render 'new'
        end
    end 
    private
      #confirm teacher
      def teacher_user
        logged_in_user
        if logged_in?
            redirect_to elearning_index_path unless current_user.teacher?
        end
      end
      def course_params
        params.require(:course).permit(:name, :description, :fee, :aim, :category, :requirement, :cover)
      end
end
