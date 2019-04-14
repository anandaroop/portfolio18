require 'rails_helper'

feature 'Slides management', type: :system do
  let!(:client) { Fabricate(:client, name: 'Mmuseumm') }
  let!(:project) { Fabricate(:project, client: client, title: 'A map') }
  let!(:tag) { Fabricate(:tag, name: 'colorful') }

  def autocomplete_tags(with:)
    fill_in 'tags', with: with
    find('#slide_tag_ids-selectized').send_keys(:enter)
  end

  scenario 'Admin creates slide' do
    visit '/admin/slides/new'

    select 'A map', from: 'Project'
    fill_in 'Caption', with: 'Here it is'
    fill_in 'Position', with: '1'
    # TODO: get this working again
    # autocomplete_tags with: 'colo'
    click_button 'Create Slide'

    expect(page).to have_text('Slide was successfully created')
  end

  scenario 'Admin edits slide' do
    slide = Fabricate(:slide, project: project, caption: 'Edit me')
    visit "/admin/slides/#{slide.id}/edit"

    fill_in 'Caption', with: 'Much better caption'
    click_button 'Update Slide'

    expect(page).to have_text('Slide was successfully updated')
    expect(page).to have_text('Much better caption')
  end
end
