class SessionsController < ApplicationController
  layout "student"
  def new
  end

  def create
    student = Student.find_by(email: params[:session][:email].downcase) # downcased before sent to database before in model.
    if student && student.authenticate(params[:session][:password]) # if email and password are correct
      # Log the user in and redirect to the user's show page.
      log_in student
      redirect_back_or(elearning_index_path)
    else 
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination' 
      #  flash.now disappear as soon as there is an additional request,
      #  specifically designed for displaying flash messages on rendered pages.
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to controller: "elearning"
  end
end
