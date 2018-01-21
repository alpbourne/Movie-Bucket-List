class BucketList < ApplicationRecord
  belongs_to :user
  has_many :bucket_list_movies
  has_many :movies, through: :bucket_list_movies
  validates :name, presence: true
  validates :name, uniqueness: true

  def movies_attributes=(movies_attributes)
    self.movies.build(movies_attributes["0"])
  end

  def bucket_list_movies_attributes=(bucket_list_movies_attributes)
    bucket_list_movies_attributes.each do |index, attribute|
      if BucketListMovie.find_by(id: attribute["id"])
        BucketListMovie.update(attribute["id"], :seen => attribute["seen"])
      end
    end
  end
end
