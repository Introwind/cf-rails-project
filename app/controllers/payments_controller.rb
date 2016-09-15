class PaymentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@price = @product.price
		@user = current_user
		token = params[:stripeToken]

		begin
			charge = Stripe::Charge.create(
				:amount => @price,
				:currency => "gbp",
				:source => token,
				:description => params[:stripeEmail]
				)

			if charge.paid
				Order.create(user_id: @user.id, product_id: @product.id , total: @price)
			end

		rescue Stripe::CardError => e
			#the card has been declined
		end

		redirect_to product_path(@product)
		flash[:notice] = "Thanks your order. Please check your email."
	end

end


  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.float   "total"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end