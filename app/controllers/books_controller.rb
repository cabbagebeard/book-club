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
        chosen = GoogleBooks.search(isbn).first
    
        @book = Book.new
        @book.title = chosen.title
        @book.description = chosen.description
        @book.author = chosen.authors
        @book.isbn = chosen.isbn
        @book.image = chosen.image_link(:zoom => 6)
        @book.save
        
        @club.books << @book
        
        if @book.save
            make_prev = @club.readings.where(current: true).first
            if make_prev then
                make_prev.current = false
                make_prev.save
            end
            
            set_current = @club.readings.find_by_book_id(@book.id)
            set_current.current = true
            set_current.save
            redirect_to @club
        else
            render 'new'
        end
    end
    
    def show
        @book = Book.find(params[:id])
        @club = Club.find(params[:club_id])
        @reading = @club.readings.where(:book_id => @book.id).first
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :description, :author, :isbn, :search)
    end
end
