class Student < ApplicationRecord
    has_many :courses
    has_many :subscriptions, foreign_key: "subscriber_id", dependent:   :destroy
    has_many :subscribeds, through: :subscriptions, source: :subscribed
    before_save { self.email = email.downcase } #downcase before save to db
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: {case_sensitive: false }
    has_secure_password     
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true #already validate presence
    validates :budget, presence: true
    mount_uploader :avatar , AvatarUploader 
    # subscribe to a course         
    def subscribe(course)
        subscribeds << course
    end   
    # stop subscribing to a course
    def unsubscribe(course)
        subscribeds.delete(course)
    end
    # subscribed already?
    def subscribed?(course)
        subscribeds.include?(course)
    end
end
