FactoryGirl.define do

	factory :product, class: Product do
		name "Test Bike"
		description "Very fast, and strong"
		image_url "http://bikeshopwarehouse.com/ProductImages/Win-Rapide_Disc-01.jpg"
		colour "Yellow"
		price "300.0"
	end
	
end