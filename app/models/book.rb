class Book < ActiveRecord::Base
    has_many: :clubs, through: :readings
    
end
