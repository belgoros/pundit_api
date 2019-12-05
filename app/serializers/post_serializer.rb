class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_one :user
  belongs_to :framework
end
