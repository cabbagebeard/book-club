class HomeController < ApplicationController
    def index
        if current_user and current_user.clubs.count >= 1
            @user_clubs = current_user.clubs
            @active_club = @user_clubs.order('updated_at DESC').first
            if @active_club.readings.count >= 1
                @current_reading = @active_club.readings.where(:current => true)[0]
                @current_book = @current_reading.book
            end
        end
    end
end
