require 'rails_helper'
describe Product do
  describe '#create' do
    it "is invalid without a name" do
     product = build(:product, name: nil)
     product.valid?
     expect(product.errors[:name]).to include("can't be blank")
    end
  

 
    it "is invalid without a detail" do
     product = build(:product, detail: nil)
     product.valid?
     expect(product.errors[:detail]).to include("can't be blank")
    end
 

 
    it "is invalid without a price" do
     product = build(:product, price: nil)
     product.valid?
     expect(product.errors[:price]).to include("can't be blank")
    end
  


    it "is invalid without a user_id" do
     product = build(:product, user_id: nil)
     product.valid?
     expect(product.errors[:user_id]).to include("can't be blank")
    end
 

 
    it "is invalid without a brand_id" do
     product = build(:product, brand_id: nil)
     product.valid?
     expect(product.errors[:brand_id]).to include("can't be blank")
    end


 
    it "is invalid without a big_category_id" do
     product = build(:product, big_category_id: nil)
     product.valid?
     expect(product.errors[:big_category_id]).to include("can't be blank")
    end


 
    it "is invalid without a middle_category_id" do
     product = build(:product, middle_category_id: nil)
     product.valid?
     expect(product.errors[:middle_category_id]).to include("can't be blank")
    end
 


    it "is invalid without a small_category_id" do
     product = build(:product, small_category_id: nil)
     product.valid?
     expect(product.errors[:small_category_id]).to include("can't be blank")
    end
 

 
    it "is invalid without a status_id" do
     product = build(:product, status_id: nil)
     product.valid?
     expect(product.errors[:status_id]).to include("can't be blank")
    end
  

 
    it "is invalid without a delivary_fee_id" do
     product = build(:product, delivary_fee_id: nil)
     product.valid?
     expect(product.errors[:delivary_fee_id]).to include("can't be blank")
    end
  

    it "is invalid without a delivary_way_id" do
     product = build(:product, delivary_way_id: nil)
     product.valid?
     expect(product.errors[:delivary_way_id]).to include("can't be blank")
    end
  
    it "is invalid without a delivary_day_id" do
     product = build(:product, delivary_day_id: nil)
     product.valid?
     expect(product.errors[:delivary_day_id]).to include("can't be blank")
    end

 
    it "is invalid without a shipping_origin_id" do
     product = build(:product, shipping_origin_id: nil)
     product.valid?
     expect(product.errors[:shipping_origin_id]).to include("can't be blank")
    end
  end
end
