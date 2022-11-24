class BooksController < ApplicationController
  def update
   book = Book.find(params[:id])
   book.update(book_params)
   flash[:notice] = "You have update book successfully"
   redirect_to book_path(book.id)
  end

  def index
   @user=current_user
   @book = Book.new
   @books = Book.all
  end
  
  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to '/books' 
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = "You have created book successfully"
       redirect_to book_path(@book.id)
    else
     @user=current_user
     @books = Book.all
     render :index
    end
  end

  def show
   @book = Book.find(params[:id])
   @books = Book.new
   @user = @book.user
  end

  def edit
   @book = Book.find(params[:id])
   @book.save
      
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
