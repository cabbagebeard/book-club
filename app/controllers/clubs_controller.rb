class ClubsController < ApplicationController
    def index
    end
    
    def new
        @club = Club.new
    end
    
    def create
        @club = Club.new(club_params)
        if @club.save
            redirect_to @club
        else
            render 'new'
        end
    end
end
