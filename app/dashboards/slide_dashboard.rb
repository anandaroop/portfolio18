require 'administrate/base_dashboard'

class SlideDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    project: Field::BelongsTo,
    tags: Field::HasMany,
    id: Field::Number,
    legacy_image: Field::String,
    image: ShrineImageField,
    caption: Field::Text,
    url: Field::String,
    created_on: Field::DateTime,
    updated_on: Field::DateTime,
    position: Field::Number,
    clip: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    legacy_image
    image
    caption
    project
    position
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    project
    id
    legacy_image
    image
    caption
    position
    url
    clip
    tags
    created_on
    updated_on
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    project
    legacy_image
    image
    caption
    position
    url
    clip
    tags
  ].freeze

  # Overwrite this method to customize how slides are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(slide)
    "#{slide.project.title} #{slide.position}"
  end
end
