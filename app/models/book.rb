class Book < ActiveRecord::Base
    has_many :readings
    has_many :clubs, through: :readings
    
end
