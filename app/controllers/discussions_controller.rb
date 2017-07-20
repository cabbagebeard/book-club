class DiscussionsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @club = Club.find(params[:club_id])
        @book = Book.find(params[:book_id])
        @reading = @club.readings.where(:book_id => @book.id).first
        
        @discussion = @reading.discussions.build(discussion_params)
        @reading.discussions << @discussion
        
        if @discussion.save
            redirect_to([@club, @book])
        end
    end
    
    private
    def discussion_params
        params.require(:discussion).permit(:title, :body)
    end
end
