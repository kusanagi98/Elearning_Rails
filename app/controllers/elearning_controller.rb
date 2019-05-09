class ElearningController < ApplicationController
    layout "elearning_show", only: :show
    layout "student", only: [:new, :create, :edit, :update]
    before_action :teacher_user, only: [:new, :create, :edit, :update, :destroy]
    before_action :correct_teacher, only: [:edit, :update, :destroy]
    def index
    end
    def show
        @course = Course.find(params[:id])
        @teacher = Student.find(@course[:student_id])
        @courses = Course.joins(:student).select('courses.course_id, courses.name, courses.category, courses.cover, courses.fee, students.student_id as id, students.name as teacher_name').where(category: @course[:category])
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
    def edit
        @course = Course.find(params[:id])
    end
    def update
        @course = Course.find(params[:id])
        if @course.update_attributes(course_params)
            # Handle a successful update.
            flash.now[:success] = "Profile updated"
            redirect_to elearning_index_path
        else
            render 'edit'
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
      def correct_teacher
        @course = Course.find(params[:id])
        unless current_user.student_id == @course.student_id
            #flash[:danger] = "Not the right user"
            redirect_to elearning_index_path
        end
      end
      def course_params
        params.require(:course).permit(:name, :description, :fee, :aim, :category, :requirement, :cover, :remove_cover)
      end
end
