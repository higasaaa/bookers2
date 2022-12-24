class BooksController < ApplicationController

  def create
    # title,bodyが＠bookに格納されている
    @book = Book.new(book_params) #bookを保存したいだけだからidはいらない
    @book.user_id = current_user.id #誰が投稿したかわかるようにするための記述
    if @book.save #保存する
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end


  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end



  private

  def book_params
    params.require(:book).permit(:title, :body, :image,)
  end


end
