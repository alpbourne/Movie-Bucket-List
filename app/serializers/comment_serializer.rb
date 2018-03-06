class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :title
  belongs_to :bucket_list, serializer: BucketListCommentSerializer
end
