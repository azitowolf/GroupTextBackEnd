class Stext < ActiveRecord::Base
  acts_as_votable
  belongs_to :ptext
  belongs_to :user
end
