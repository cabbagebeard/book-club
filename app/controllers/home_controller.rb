class HomeController < ApplicationController
    def index
        user_clubs = current_user.clubs if current_user.clubs.count >= 1
        @active_club = user_clubs.order('updated_at DESC').first
        @current_reading = @active_club.readings.where(:current => true)[0]
        @current_book = @current_reading.book
    end
end
