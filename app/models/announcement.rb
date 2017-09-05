class Announcement < ActiveRecord::Base
    belongs_to :club
    belongs_to :user
    
    validates :subject, presence: true, length: { minimum: 3 }
    validates :body, presence: true, length: { minimum: 3 }
end
