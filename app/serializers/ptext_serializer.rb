class PtextSerializer < ActiveModel::Serializer
  attributes :id, :title, :history, :text, :user
  has_many :stexts
end
