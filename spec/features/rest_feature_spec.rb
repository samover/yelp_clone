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

  context 'Creating restaurants' do
    scenario 'Prompts user to fill out a form, then displays new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Bocado'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Bocado'
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do
    let!(:bocado){Restaurant.create(name:'Bocado')}

    scenario 'Let a user view a restaurant' do
      visit '/restaurants'
      click_link 'Bocado'
      expect(page).to have_content('Bocado')
      expect(current_path).to eq "/restaurants/#{bocado.id}"
    end
  end

  context 'editing restaurants' do
    before { Restaurant.create(name: 'Bocado')}

    scenario 'Let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit Bocado'
      fill_in 'Name', with: 'Vegan Paradise'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Vegan Paradise'
      expect(current_path).to eq '/restaurants'
    end
  end
end
