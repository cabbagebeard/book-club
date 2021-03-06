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
    
    def make_admin
        @club = Club.find(params[:club_id])
        @membership = @club.memberships.find(params[:member_id])
        if @club.memberships.find_by_user_id(current_user.id).admin == true
            if @membership.admin == false
                @membership.admin = true
                @membership.save
                flash[:success] = "Member has been made admin."
            else
                flash[:success] = "This member is already an admin."
            end
        else
            flash[:danger] = "You do not have permission."
        end
        redirect_to :back
    end
    
    def del_admin
        @club = Club.find(params[:club_id])
        @membership = @club.memberships.find(params[:member_id])
        if @club.memberships.find_by_user_id(current_user.id).admin == true
            if @membership.admin
                @membership.admin = false
                @membership.save
                flash[:success] = "Member has been stripped of admin rights."
            else
                flash[:success] = "This member cannot be stripped of admin rights."
            end
        else
            flash[:danger] = "You do not have permission."
        end
        redirect_to :back
    end
    
    def destroy
        @club = Club.find(params[:club_id])
        @membership = @club.memberships.find(params[:membership_id])
        if @membership.user == current_user
            @membership.destroy
            if @club.memberships.count == 0 
                @club.destroy
                flash[:danger] = "The club has been disbanded."
            end
            flash[:danger] = "You have left the club."
            redirect_to root_path
        else
            @membership.destroy
            flash[:success] = "Member has been kicked."
            redirect_to :back
        end
    end
end
