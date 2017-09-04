class AnnouncementsController < ApplicationController
    def new
        @club = Club.find(params[:club_id])
        
        @announcement = Announcement.new
    end
    
    def create
        @club = Club.find(params[:club_id])
        
        @announcement = @club.announcements.build(announcement_params)
        @club.announcements << @announcement
        @announcement.user_id << current_user.id
        
        if @discussion.save
            redirect_to(@club)
            flash[:success] = "Announcement created!"
        else
            redirect_to(@club)
            flash[:danger] = "Something went wrong while posting your announcement. Please try again."
        end
    end

private
    def announcement_params
        params.require(:announcement).permit(:subject, :body, :club_id, :user_id)
    end
end
