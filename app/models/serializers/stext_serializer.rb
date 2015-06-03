class StextSerializer < ActiveModel::Serializer
  attributes :user, :title, :text, :votes
end
