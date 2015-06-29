class PtextSerializer < ActiveModel::Serializer
  attributes :id, :history, :text, :user

  def allVotes
    @total = 0
    object.stexts.each{|stext| @total += stext.get_likes.size}
    @total
  end

end
