class Club < ActiveRecord::Base
    has_many :books
    
    validates :name, presence: true, length: { minimum: 5 }
end
