class DiscussionsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @club = Club.find(params[:club_id])
        @book = Book.find(params[:book_id])
        @reading = @club.readings.where(:book_id => @book.id).first
        
        @discussion = @reading.discussions.build(discussion_params)
        @reading.discussions << @discussion
        @discussion.user_id = current_user.id
        
        if @discussion.save
            redirect_to([@club, @book])
        end
    end
    
    def show
        @club = Club.find(params[:club_id])
        @book = Book.find(params[:book_id])
        @reading = Reading.find(params[:book_id])
        
        @discussion = Discussion.find(params[:id])
        
        if @discussion.reading_id != @reading.id and @reading.club_id != @club.id
            redirect_to root_path
        end
    end
    
    private
    def discussion_params
        params.require(:discussion).permit(:title, :body, :user_id)
    end
end
