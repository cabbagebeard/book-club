class Club < ActiveRecord::Base
    belongs_to :user
    has_many :books
    has_many :memberships
    has_many :users, through: :memberships

    validates :name, presence: true, length: { minimum: 5 }
end
