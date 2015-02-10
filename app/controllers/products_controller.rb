class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:index, :show, :pinview]

  def index
    @products = Product.all.order("category_id", "pname").paginate(:page => params[:page], :per_page => 16)
  end
  
  def pinview
    @products = Product.all.order("category_id", "pname").paginate(:page => params[:page], :per_page => 16)
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
     @product = Product.find(params[:id])
    end

    def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to products_path, notice: "Not authorized to edit this product" if @product.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:description, :category, :subcategory, :image, :document, :pname, :label, :grade, :pack_size)
    end
end