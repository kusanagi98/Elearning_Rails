class Subscription < ApplicationRecord
  belongs_to :subscriber, class_name: "Student"
  belongs_to :subscribed, class_name: "Course"
  validates :subscriber_id, presence: true
  validates :subscribed_id, presence: true
end
