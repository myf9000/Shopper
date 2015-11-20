FactoryGirl.define do
	factory :product do 
  		name "Rails"
  	end

  	factory :invalid_product, :class => Product do 
  		name "R"
  	end
end