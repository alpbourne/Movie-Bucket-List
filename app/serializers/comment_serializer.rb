class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :bucket_list, serializer: BucketListCommentSerializer
end
