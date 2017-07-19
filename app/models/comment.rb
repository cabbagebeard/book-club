class Comment < ActiveRecord::Base
    belongs_to :discussions
end
