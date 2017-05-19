class ProductsController < ApplicationController
  #skip_before_action :authenticate_user, only: [:index]
  def index
  	@product = Product.all
  end

  def new
  	@product = Product.new
  end
  def create
  	 image_attributes = product_params[:image]["photo"]
     product_params.delete(:image)
     @product = Product.new(product_params)
     if @product.save
        image_attributes.each do |each_image|
          image = Image.new(photo: each_image, product: @product)
          image.save(validate: false)
        end
        redirect_to products_path
        else
         render :new
     end
  end
  def edit
  end

  def show
  end

  private
  def product_params
  	params.require(:product).permit!
  end
end

