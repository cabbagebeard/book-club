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
            flash[:success] = "Discussion created!"
        else
            redirect_to([@club, @book])
            flash[:danger] = "Something went wrong while posting your discussion. Please try again."
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
    
    def update
    end
    
    def destroy
        @discussion = Discussion.find(params[:discussion_id])
        if @discussion.user == current_user
            @discussion.destroy
            flash[:warning] = "You have deleted your discussion."
        else
            flash[:danger] = "You do not have permission to delete this discussion."
        end
        redirect_to :back
    end
    
    
    private
    def discussion_params
        params.require(:discussion).permit(:title, :body, :user_id)
    end
end
