class PtextSerializer < ActiveModel::Serializer
  attributes :title, :user, :history, :text
end
