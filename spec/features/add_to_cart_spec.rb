require 'rails_helper'


RSpec.feature "users can add a product to their cart.", type: :feature, js: true do
  # SETUP

  before :each do
    @category = Category.create! name: 'Aesthetics'

    10.times do |n|
      @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
    end
  end

  # scenario block => it block
  scenario "User clicks add on the 1st product" do
    # ACT
    visit root_path
    page.find('div.products article:first-child .actions').click_on('Add')
    # DEBUG / VERIFY
    
    sleep 1
    puts page.html
    save_screenshot
    expect(page.find('#navbar ul:nth-child(2)')).to have_text('My Cart (1)')
    visit '/cart'
    save_screenshot
  end
end