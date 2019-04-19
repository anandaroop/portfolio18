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
            edges {
              node {
                name
                projects {
                  edges {
                    node {
                      title
                      slides {
                        edges {
                          node {
                            caption
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      QUERY
    end

    let(:expected) do
      {
        "clients": {
          "edges": [
            {
              "node": {
                "name": 'The Museum',
                "projects": {
                  "edges": [
                    {
                      "node": {
                        "title": 'The Show',
                        "slides": {
                          "edges": [
                            {
                              "node": {
                                "caption": 'New slide'
                              }
                            },
                          ]
                        }
                      }
                    },
                  ]
                }
              }
            },
            {
              "node": {
                "name": 'The Press',
                "projects": {
                  "edges": [
                    {
                      "node": {
                        "title": 'The Book',
                        "slides": {
                          "edges": [
                            {
                              "node": {
                                "caption": 'Old slide'
                              }
                            },
                          ]
                        }
                      }
                    },
                  ]
                }
              }
            },
          ]
        }
      }.with_indifferent_access
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
            edges {
              node {
                year
                projects {
                  edges {
                    node {
                      client {
                        name
                      }
                      title
                      slides {
                        edges {
                          node {
                            caption
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      QUERY
    end

    let(:expected) do
      {
        "years": {
          "edges": [
            {
              "node": {
                "year": 2016,
                "projects": {
                  "edges": [
                    {
                      "node": {
                        "client": {
                          "name": 'The Museum'
                        },
                        "title": 'The Show',
                        "slides": {
                          "edges": [
                            {
                              "node": {
                                "caption": 'New slide'
                              }
                            },
                          ]
                        }
                      }
                    },
                  ]
                }
              }
            },
            {
              "node": {
                "year": 2015,
                "projects": {
                  "edges": [
                    {
                      "node": {
                        "client": {
                          "name": 'The Press'
                        },
                        "title": 'The Book',
                        "slides": {
                          "edges": [
                            {
                              "node": {
                                "caption": 'Old slide'
                              }
                            },
                          ]
                        }
                      }
                    },
                  ]
                }
              }
            },
          ]
        }
      }.with_indifferent_access
    end

    it 'can return projects grouped by year' do
      expect(result['data']).to eq(expected)
    end
  end
end
