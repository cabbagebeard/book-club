class HomeController < ApplicationController
    def index
        user_clubs = current_user.clubs if current_user.clubs.count >= 1
        @active_club = user_clubs.order('updated_at DESC').first
    end
end
