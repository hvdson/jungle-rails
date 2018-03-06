require 'rails_helper'

RSpec.feature "users can navigate from the home page to the product detail page by clicking on a product.", type: :feature, js: true do
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
  scenario "They can click a product" do
    # ACT
    visit root_path
    page.find('div.products article:first-child .actions').click_on('Details')
    # DEBUG / VERIFY
    
    sleep 1
    puts page.html
    save_screenshot
    expect(page).to have_css('section.products-show')
  end
end