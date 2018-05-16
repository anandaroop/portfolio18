require 'rails_helper'

feature 'Projects management', type: :system do
  let!(:client) { Fabricate :client, name: 'Mmuseumm' }

  scenario 'Admin creates project' do
    visit '/admin/projects/new'

    select 'Mmuseumm', from: 'Client'
    fill_in 'Title', with: 'A map'
    fill_in 'Subtitle', with: 'Of all the places'
    fill_in 'Year', with: '2018'
    fill_in 'Month', with: '5'
    fill_in 'Description', with: 'Lorem ipsum dolor sit amet'
    check 'Visible'
    click_button 'Create Project'

    expect(page).to have_text('Project was successfully created')
  end

  scenario 'Admin edits project' do
    project = Fabricate(:project, client: client, title: 'Edit me')
    visit "admin/projects/#{project.id}/edit"

    fill_in 'Title', with: 'Much better title'
    click_button 'Update Project'

    expect(page).to have_text('Project was successfully updated')
    expect(page).to have_text('Much better title')
  end
end
