class Post < ApplicationRecord
  self.table_name = :posts

  has_one_attached :image
  has_one_attached :mulitmedia

  enum mulitmedia_type: %i[audio video]
end
