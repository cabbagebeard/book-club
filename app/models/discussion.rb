class Discussion < ActiveRecord::Base
    belongs_to :reading
    belongs_to :user
    has_many :comments
end
