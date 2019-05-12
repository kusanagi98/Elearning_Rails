class Course < ApplicationRecord
    belongs_to :student
    has_many :subscriptions, foreign_key: "subscribed_id"
    has_many :subscribers, through: :subscriptions, source: :subscriber
    validates :name,  presence: true, length: { maximum: 50 }
    validates :student_id, presence: true
    mount_uploader :cover, CoverUploader
end
