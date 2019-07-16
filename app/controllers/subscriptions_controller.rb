class SubscriptionsController < ApplicationController
    before_action :logged_in_user
    def create
        course = Course.find(params[:subscribed_id])
        if check_budget(course)
            current_user.subscribe(course)
            current_user.update_attributes(budget: (current_user.budget - course.fee))
            redirect_to elearning_index_path
        else 
            redirect_to elearning_index_path
        end
    end
  
    def destroy
        course = Subscription.find(params[:id]).subscribed
        current_user.unsubscribe(course)
        redirect_to elearning_index_path
    end
    private
        def check_budget(course)
            current_user.budget >= course.fee
        end
end
