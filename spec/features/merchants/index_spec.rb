require 'rails_helper'

RSpec.describe 'merchant index' do
    before :each do
        @merchant1 = Merchant.create!(name: "william")
        @merchant2 = Merchant.create!(name: "bob")
        @item1 = Item.create!(name: "item1", description: "description1", unit_price: 1, merchant_id: @merchant1.id)
        @item2 = Item.create!(name: "item2", description: "description2", unit_price: 2, merchant_id: @merchant1.id)
        @item3 = Item.create!(name: "item3", description: "description3", unit_price: 3, merchant_id: @merchant1.id)
    end
  describe 'index' do
    it 'indexs' do
      visit '/merchants'
      expect(page).to have_content("william")
      click_on "william"
      expect(page).to have_content("william")
      expect(page).to have_content("item1")
      expect(page).to have_content("description1")
      expect(page).to have_content("1")
      expect(page).to have_content("item2")
      expect(page).to have_content("description2")
      expect(page).to have_content("2")
      expect(page).to have_content("item3")
      expect(page).to have_content("description3")
      expect(page).to have_content("3")
    end
  end
end
