class Club < ActiveRecord::Base
    belongs_to :user
    has_many :readings
    has_many :announcements
    has_many :books, through: :readings
    has_many :memberships
    has_many :users, through: :memberships

    validates :name, presence: true, length: { minimum: 3 }
end
