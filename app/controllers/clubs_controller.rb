class ClubsController < ApplicationController
    before_action :authenticate_user!

    def index
        @club = Club.all
    end
    
    def new
        @club = current_user.clubs.build
    end
    
    def create
        @club = current_user.clubs.build(club_params)
        
        if @club.save
            current_user.clubs << @club
            ad = @club.memberships.find_by_user_id(current_user.id)
            ad.admin = true
            ad.save!
            redirect_to @club
        else
            if @club.errors.any?
                @club.errors.full_messages.each do |msg|
                  flash[:danger] = msg
              end
             end
            redirect_to new_club_path
        end
    end
    
    def show
        @club = Club.find(params[:id])
    end
    
    def edit
        @club = Club.find(params[:id])
        ad = @club.memberships.find_by_user_id(current_user.id)
        if ad.admin = true then
            render 'edit'
        else
            flash[:danger] = "You are not an admin of this club."
            redirect_to @club
        end
    end
    
    private
    def club_params
        params.require(:club).permit(:name, :description)
    end
end
