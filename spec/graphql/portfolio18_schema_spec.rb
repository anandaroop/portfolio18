require 'rails_helper'

RSpec.describe Portfolio18Schema do
  let(:context) { {} }
  let(:variables) { {} }

  let(:result) do
    res = Portfolio18Schema.execute(
      query_string,
      context: context,
      variables: variables
    )
    # Print any errors
    pp res if res['errors']
    res
  end

  let!(:client1) { Fabricate(:client, name: 'The Museum') }
  let!(:project1) { Fabricate(:project, title: 'The Show', client: client1, year: 2016, month: 3) }
  let!(:slide1) { Fabricate(:slide, caption: 'New slide', project: project1) }

  let!(:client2) { Fabricate(:client, name: 'The Press', abbr: 'p') }
  let!(:project2) { Fabricate(:project, title: 'The Book', client: client2, year: 2015, month: 9) }
  let!(:slide2) { Fabricate(:slide, caption: 'Old slide', project: project2) }

  describe 'clients query' do
    let(:query_string) do
      <<~QUERY
        {
          clients {
            name
            projects {
              title
              slides {
                caption
              }
            }
          }
        }
      QUERY
    end

    let(:expected) do
      {
        'clients' => [
          {
            'name' => 'The Museum',
            'projects' => [
              {
                'title' => 'The Show',
                'slides' => [{ 'caption' => 'New slide' }]
              },
            ]
          },
          {
            'name' => 'The Press',
            'projects' => [
              {
                'title' => 'The Book',
                'slides' => [{ 'caption' => 'Old slide' }]
              },
            ]
          },
        ]
      }
    end

    it 'can return projects grouped by client' do
      expect(result['data']).to eq(expected)
    end
  end

  describe 'years query' do
    let(:query_string) do
      <<~QUERY
        {
          years {
            year
            projects {
              client {
                name
              }
              title
              slides {
                caption
              }
            }
          }
        }
      QUERY
    end

    let(:expected) do
      {
        'years' => [
          {
            'year' => 2016,
            'projects' => [
              {
                'title' => 'The Show',
                'client' => { 'name' => 'The Museum' },
                'slides' => [{ 'caption' => 'New slide' }]
              },
            ]
          },
          {
            'year' => 2015,
            'projects' => [
              {
                'title' => 'The Book',
                'client' => { 'name' => 'The Press' },
                'slides' => [{ 'caption' => 'Old slide' }]
              },
            ]
          },
        ]
      }
    end

    it 'can return projects grouped by year' do
      expect(result['data']).to eq(expected)
    end
  end
end
