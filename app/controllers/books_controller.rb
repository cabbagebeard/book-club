class BooksController < ApplicationController
    before_action :authenticate_user!

    def index
    end
    
    def new
        @club = Club.find(params[:club_id])
        if params[:search].present? and params[:search].length > 3
            @books = GoogleBooks.search("#{params[:search].downcase}", {:order_by => 'relevance'})
        end
        @book = @club.books.build
    end
    
    def create
        @club = Club.find(params[:club_id])
        
        isbn = params[:isbn]
        
        puts isbn
        
        chosen = GoogleBooks.search(isbn).first
        
        puts chosen.title
        
        @book = Book.new
        @book.title = chosen.title
        @book.description = chosen.description
        @book.author = chosen.authors
        @book.isbn = chosen.isbn
        @book.save
        
        @book.clubs << @club
        @club.books << @book
        
        if @book.save
            redirect_to @club
        else
            render 'new'
        end
    end
    
    def show
        @book = Book.find(params[:id])
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :description, :author, :isbn, :search)
    end
end
