class Reading < ActiveRecord::Base
    belongs_to :club
    belongs_to :book
end
