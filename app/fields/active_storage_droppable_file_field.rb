require "administrate/field/base"

class ActiveStorageDroppableFileField < Administrate::Field::Base
  def to_s
    data
  end
end
