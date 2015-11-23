require 'rails_helper'

feature 'Restaurants' do
  context 'No restaurants have been added' do
    scenario 'Should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'Restaurants have been added' do
    before do
      Restaurant.create( name: 'Bocado' )
    end
    scenario 'Display restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'Bocado'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end
end
