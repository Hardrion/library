class Api::V1::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :country, :publication_date, :total_chapters
end
