require 'rails_helper'

feature 'Clients management', type: :system do
  scenario 'Admin creates client' do
    visit '/admin/clients/new'

    fill_in 'Name', with: 'Mmuseumm'
    click_button 'Create Client'

    expect(page).to have_text('Client was successfully created')
  end

  scenario 'Admin edits client' do
    client = Fabricate(:client, name: 'Edit me')
    visit "/admin/clients/#{client.id}/edit"

    fill_in 'Name', with: 'Much better name'
    click_button 'Update Client'

    expect(page).to have_text('Client was successfully updated')
    expect(page).to have_text('Much better name')
  end
end
