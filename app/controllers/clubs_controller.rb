class ClubsController < ApplicationController
    
    def index
        @club = Club.all
    end
    
    def new
        @club = current_user.clubs.build
    end
    
    def create
        @club = current_user.clubs.build(club_params)
        current_user.clubs << @club
        
        ad = @club.memberships.find_by_user_id(current_user.id)
        ad.admin = true
        ad.save!
        
        if @club.save
            redirect_to @club
        else
            render 'new'
        end
    end
    
    def show
        @club = Club.find(params[:id])
    end
    
    private
    def club_params
        params.require(:club).permit(:name, :description)
    end
end
