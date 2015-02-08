class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]


  respond_to :html

  def index
    @subcategories = Subcategory.all.order("category_id")
    respond_with(@subcategories)
  end

  def show
    respond_with(@subcategory)
  end

  def new
    @subcategory = Subcategory.new
    respond_with(@subcategory)
  end

  def edit
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    @subcategory.save
    respond_with(@subcategory)
  end

  def update
    @subcategory.update(subcategory_params)
    respond_with(@subcategory)
  end

  def destroy
    @subcategory.destroy
    respond_with(@subcategory)
  end

  private
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    def subcategory_params
      params.require(:subcategory).permit(:description, :category_id)
    end
end
