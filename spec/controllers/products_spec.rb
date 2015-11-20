require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { FactoryGirl.create(:product) }

  describe "GET #index" do
    it "assigns @products" do
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns @product" do
      get :show, id: product.id
      expect(assigns(:product)).to eq(product)
    end

    it "renders the show template" do
      get :show, id: product.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      get :edit, id: product.id
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do 
  	it "it redirect to root path" do
  	  get :destroy, id: product.id
  	  expect(response).to redirect_to(root_path)
  	end

  	it "deletes product" do
  	  product = FactoryGirl.create(:product)
  	  expect{delete :destroy, id: product.id}.to change(Product,:count).by(-1)
  	end
  end

  describe "POST #create" do
  	context "with valid attributes" do
	  it "with valid attributes" do
	  	expect{post :create, product: FactoryGirl.attributes_for(:product)}.to change(Product, :count).by(1)
	  end

	  it "redirect to product" do
	  	post :create, product: FactoryGirl.attributes_for(:product)
	  	expect(response).to redirect_to(Product.last)
	  end
  	end

  	context "with invalid attributes" do
  	  it "with valid attributes" do
  	    expect{post :create, product: FactoryGirl.attributes_for(:invalid_product)}.to_not change(Product, :count)
  	  end

  	  it "re-render to new" do
  	    post :create, product: FactoryGirl.attributes_for(:invalid_product)
  	    expect(response).to render_template(:new)
  	  end
    end
  end

  describe "PUT #update" do 
  	context "valid atributes" do
  	  it "located the requested @product" do
        put :update, id: product.id, product: FactoryGirl.attributes_for(:product)
        expect(assigns(:product)).to eq(product)      
      end
  
      it "changes @product's attributes" do
        put :update, id: product.id, product: FactoryGirl.attributes_for(:product, name: "Julia")
        product.reload
        expect(product.name).to eq("Julia")
      end
  
      it "redirects to the updated product" do
        put :update, id: product.id, product: FactoryGirl.attributes_for(:product)
        expect(response).to redirect_to product
      end
  	end

  	context "invalid atributes" do
  	  it "located the requested @product" do
        put :update, id: product.id, product: FactoryGirl.attributes_for(:invalid_product)
        expect(assigns(:product)).to eq(product)      
      end
  
      it "does not change @product's attributes" do
        put :update, id: product.id, product: FactoryGirl.attributes_for(:product, name: nil)
        product.reload
        expect(product.name).to_not eq("Julia")
      end
  
      it "re-renders the edit method" do
        put :update, id: product.id, product: FactoryGirl.attributes_for(:invalid_product)
        expect(response).to render_template(:edit) 
      end
  	end
  end

end 