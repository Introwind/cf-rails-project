class CommentsController < ApplicationController
  load_and_authorize_resource
  
	def create
    	@product = Product.find(params[:product_id])
    	@comment = @product.comments.new(comment_params)
    	@comment.user = current_user
    	@comment.save
    	@user = current_user
    	respond_to do |format|
    		if @comment.save
    			format.html { redirect_to @product, notice: 'Review was created successfully.'}
    			format.json { render :show, status: :created, location: @product }
    			format.js    			
    		else
    			format.html { redirect_to @product, alert: 'Review was not saved successfully' }
    			format.json { render json: @comment.errors, status: :unprocessable_entity }
    		end
	 	end
	end

	def new
	end

	def destroy
		@comment = Comment.find(params[:id])
		@product = @comment.product
		@comment.destroy
		respond_to do |format|
			format.html { redirect_to product_path(@product) }
			format.js
			
		end
	end

	def edit
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :body, :rating)
	end
end