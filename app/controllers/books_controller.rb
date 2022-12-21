class BooksController < ApplicationController

  def create
    # title,bodyが＠bookに格納されている
    @book = Book.new(book_params) #bookを保存したいだけだからidはいらない
    @book.user_id = current_user.id #誰が投稿したかわかるようにするための記述
    @book.save #保存する
    redirect_to book_path(@book.id)
  end


  def index
    @book = Book.new
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path(book.id)
  end



  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
