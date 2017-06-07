class Club < ActiveRecord::Base
    belongs_to :user
    has_many :books
    
    validates :name, presence: true, length: { minimum: 5 }
end
