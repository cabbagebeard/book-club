class CommentsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @discussion = Discussion.find(params[:discussion_id])
        @comment = current_user.comments.new(comment_params)
        @discussion.comments << @comment
        
        if @comment.save
            redirect_to :back
            flash[:success] = "Thanks for the comment!"
        else
            redirect_to :back
            flash[:danger] = "Something went wrong and we could not save your comment. Please try again."
        end
    end
    
    def destroy
        @comment = Comment.find(params[:comment_id])
        @club = Club.find(params[:club_id])
        admin = @club.memberships.find_by_user_id(current_user.id).admin
        if @comment.user == current_user or admin == true
            @comment.destroy
            flash[:warning] = "You have deleted your comment."
        else
            flash[:danger] = "You do not have permission to delete this comment."
        end
        redirect_to :back
    end
    
    
    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :reading_id)
    end
end
