module Types
  class ProjectSort < Types::BaseEnum
    value 'TITLE_ASC', 'Order alphabetically by title', value: 'title asc'
    value 'TITLE_DESC', 'Order reverse-alphabetically by title', value: 'title desc'
    value 'DATE_ASC', 'Order chronologically by completion date', value: 'year asc, month asc, title asc'
    value 'DATE_DESC', 'Order reverse-chronologically by completion date', value: 'year desc, month desc, title asc'
  end
end
