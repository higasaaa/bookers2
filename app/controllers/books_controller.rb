class BooksController < ApplicationController

  before_action :authenticate_user!
# ユーザーがログインしてなかったらログインページに行くようにする

  def create
    # title,bodyが＠bookに格納されている
    @book = Book.new(book_params) #bookを保存したいだけだからidはいらない
    @book.user_id = current_user.id #誰が投稿したかわかるようにするための記述
    if @book.save #保存する
      redirect_to books_path(@book.id)
    else
      @user = current_user
      @books = Book.all
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)#user/showに飛ぶ
    else
      render :edit
    end
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
