require 'administrate/field/base'

class ShrineImageField < Administrate::Field::Base
  def to_s
    data
  end

  def stored?
    data.is_a? Hash
  end

  def url(variant = 'small')
    return unless stored?
    data.fetch(variant.to_sym, nil).try(:url)
  end

  def cached?
    data.is_a? SlideImageUploader::UploadedFile
  end

  def cached_url
    return unless cached?
    data.url
  end

  def cached_value
    resource.send("cached_#{attribute}_data")
  end
end
