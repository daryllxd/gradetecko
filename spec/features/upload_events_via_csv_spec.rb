# frozen_string_literal: true

require 'rails_helper'

# Having some trouble on doing a before(:each) for test steps
# Added duplicate code for now just to make sure the test for Event count
# is separated from the test for showing an alert
describe 'Upload Events via CSV', type: :feature do
  context 'happy path' do
    let!(:file_path) { File.absolute_path('spec/fixtures/example.csv') }

    it 'uploads the events' do
      visit('/events')
      attach_file('events_csv', file_path)

      click_button 'Submit'

      expect(Event.count).to eq(7)
    end

    it 'shows an alert-success with a helpful success message' do
      visit('/events')
      attach_file('events_csv', file_path)

      click_button 'Submit'

      expect(page).to have_css('.alert.alert-success')
      expect(page).to have_content('example.csv was seeded')
    end
  end

  context 'negative path/errors' do
    context 'bad csv file' do
      let!(:file_path) { File.absolute_path('spec/fixtures/incomplete_example.csv') }

      it 'does not upload any event' do
        visit('/events')
        attach_file('events_csv', file_path)

        click_button 'Submit'

        expect(Event.count).to eq(0)
      end

      it 'shows an alert-danger with a helpful error message' do
        visit('/events')
        attach_file('events_csv', file_path)

        click_button 'Submit'

        expect(page).to have_css('.alert.alert-danger')
        expect(page).to have_content('Error with seeding incomplete_example.csv.')
      end
    end
  end
end
