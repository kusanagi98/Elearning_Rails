class Course < ApplicationRecord
    belongs_to :student
    validates :name,  presence: true, length: { maximum: 50 }
    validates :student_id, presence: true
    mount_uploader :cover, CoverUploader
end
