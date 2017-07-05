class BooksController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:search].present?
            @books = Book.where('author LIKE ?', "%#{params[:search]}%")
        end
    end
    
    def new
        @book = Book.new
    end
    
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            render 'new'
        end
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :description, :author, :search)
    end
end
