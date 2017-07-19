class Comment < ActiveRecord::Base
    belongs_to :discussions
    belongs_to :user
end
