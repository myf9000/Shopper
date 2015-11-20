class Product < ActiveRecord::Base
	validates :name, presence: :true, 
			  		 length: { minimum: 5, maximum: 200 }
end
