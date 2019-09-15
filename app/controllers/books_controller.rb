class BooksController < ApplicationController
  def top
  end

  def new
     @book = Book.new

  end

    def create
         @book = Book.new(book_params)
         # @book.save
         if @book.save
           flash[:notice] = "Book was successfully updated."
           redirect_to book_path(@book.id)
         else
          @books = Book.all
          render action: :index
        end
    end

    def index
    	@books = Book.all
      @book = Book.new
    end

    def show
      @book = Book.find(params[:id])
    end

    def edit
      @book = Book.find(params[:id])
    end

    def update
      post = Book.find(params[:id])
      post.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path

    end

    def destroy
      post = Book.find(params[:id])
      post.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
end



  private
    def book_params
  	params.require(:book).permit(:title, :body)
  end
end