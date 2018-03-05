require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    # xzibit == ('xz' 'y' 'bit')
    # xyzzy    
    # right now this tests the entire object's validity;  should just test one thing in this test (i.e. the name) and then other things in other tests
    before do
      cat3 = Category.find_or_create_by! name: 'Furniture'

      @product = cat3.products.create!({
        name:  'xzibit',
        description: 'it\'s lit',
        quantity: 0,
        price: 2_483.75
      })
    end

    it 'should be invalid if the name field is empty' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq('Name can\'t be blank')
    end

    it 'should be invalid if the price field is empty' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq('Price cents is not a number')
    end

    it 'should be invalid if the quantity field is empty' do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq('Quantity can\'t be blank')
    end
    
    it 'should be invalid if the category field is empty' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq('Category can\'t be blank')
    end
  end
end


# describe '#id' do
#   it 'should not exist for new products' do
#     @product = Product.new
#     expect(@product.id).to be_nil
#   end
# end