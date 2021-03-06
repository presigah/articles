class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authetificate_user!, only:[ :new, :created ]

  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
    @pagy, @review_comment = pagy(@book.reviews.order(created_at: :desc), items: 5)
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        if !@book.cover_page.attached?
          @book.cover_page.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'defauld-icon-article.jpg')), filename: 'default-image-article.jpg', content_type: 'image/jpg ')
        end
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :abstract, :price, :edition, :author_first_name, :author_last_name, :author_email, :author_job_title,  :type_book, :cover_page, :book)
    end
end
