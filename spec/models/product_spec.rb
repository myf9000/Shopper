require 'rails_helper'

RSpec.describe Product, type: :model do
	it "is valid with title" do 
		product = Product.new(name: "Rails")
		expect(product).to be_valid
	end

	it "is invalid without title" do 
		product = Product.new()
		expect(product).to_not be_valid
	end

	it "is valid with title which has 5 characters" do 
		product = Product.new(name: "Rails")
		expect(product).to be_valid
	end

	it "is invalid with title which has not 5 characters" do 
		product = Product.new(name: "Rail")
		expect(product).to_not be_valid
	end

	it "is invalid with title which has 201 characters" do 
		title = "R" * 201
		product = Product.new(name: title)
		expect(product).to_not be_valid
	end

end 