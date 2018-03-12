class MovieSerializer < ActiveModel::Serializer
  attributes :id, :genre, :rating
end
