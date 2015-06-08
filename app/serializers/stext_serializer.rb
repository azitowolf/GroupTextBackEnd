class StextSerializer < ActiveModel::Serializer
  attributes :id, :text, :user, :virtual

def virtual
  object.get_likes.size
end

end
