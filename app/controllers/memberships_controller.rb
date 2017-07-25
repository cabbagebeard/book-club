class MembershipsController < ApplicationController
    def new
        @club = Club.find(params[:club_id])
        
        if params[:username].present? and params[:username].length > 2
            @users = User.where("username LIKE ?" , "%#{params[:username]}%")
        end
    end
    
    def create
        @user = User.find(params[:user_id])
        @club = Club.find(params[:club_id])
        
        if @user.memberships.find_by_club_id(@club.id)
            flash[:notice] = "This user is already a member!"
            redirect_to :back
        else
            @membership = @user.memberships.build(:club_id => @club.id)
        end
        
        if @membership and @membership.save
            flash[:notice] = "You have added #{@user.username} to the club."
            redirect_to :back
        else
          flash[:error] = "Unable to add member."
          redirect_to :back
        end
    end
end
