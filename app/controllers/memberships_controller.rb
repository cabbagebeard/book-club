class MembershipsController < ApplicationController
    def create
        @user = User.find_by_email(params[:email])
        @user = User.find_by_username(params[:username])
        
        @club = Club.find(params[:club_id])
        
        if @user.memberships.find_by_club_id(@club.id)
            flash[:notice] = "This user is already a member!"
            redirect_to :back
        else
            @membership = @user.memberships.build(:club_id => @club.id)
        end
        
        if @membership.save
            flash[:notice] = "You have added #{@user.username} to the club."
            redirect_to :back
        else
          flash[:error] = "Unable to add member."
          redirect_to :back
        end
    end
end
