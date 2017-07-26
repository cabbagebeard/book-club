class MembershipsController < ApplicationController
    def new
        @club = Club.find(params[:club_id])
        
        if params[:email].present? and params[:email].length > 5 and params[:email].include?("@")
            @users = User.where("email LIKE ?" , "%#{params[:email].downcase}%")
        end
    end
    
    def create
        @user = User.find(params[:user_id])
        @club = Club.find(params[:club_id])
        
        @membership = @user.memberships.build(:club_id => @club.id) unless @user.memberships.find_by_club_id(@club.id)

        if @membership and @membership.save
            flash[:success] = "You have added #{@user.username} to the club."
            redirect_to edit_club_path(:id => @club.id)
            else
            if @user.memberships.find_by_club_id(@club.id)
                flash[:danger] = "This user is already a member."
                redirect_to :back
            else
              flash[:danger] = "Unable to add member."
              redirect_to :back
            end
        end
    end
    
    def show
        @club = Club.find(params[:club_id])
        @membership = @club.memberships.find(params[:id])
    end
    
    def destroy
        @club = Club.find(params[:club_id])
        @club.memberships.find(params[:membership_id]).destroy
        flash[:success] = "Member has been kicked."
        redirect_to :back
    end
end
