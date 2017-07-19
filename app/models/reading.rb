class Reading < ActiveRecord::Base
    belongs_to :club
    belongs_to :book
    has_many :discussions
end
