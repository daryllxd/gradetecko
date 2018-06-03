# frozen_string_literal: true

require 'rails_helper'

describe 'Check Object Status', type: :feature do
  before(:all) { create_sample_database }
  after(:all) { Event.destroy_all }

  context 'happy path' do
    it 'show a Bootstrap alert with details of the state' do
      visit '/statuses'

      fill_in('object_id', with: '1')
      fill_in('timestamp', with: '1484733173')
      select('Order', from: 'object_type', visible: false)
      click_button 'Submit'

      expect(page).to have_css('.alert')
      expect(page).to have_content('Jack')
      expect(page).to have_content('paid')
    end
  end

  context 'negative path/errors' do
    it 'does not show an alert' do
      visit '/statuses'

      fill_in('object_id', with: '')
      fill_in('timestamp', with: '1484733173')
      select('Order', from: 'object_type', visible: false)
      click_button 'Submit'

      expect(page).not_to have_css('.alert')
    end
  end
end
