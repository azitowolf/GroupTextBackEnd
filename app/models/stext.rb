class Stext < ActiveRecord::Base
  belongs_to :ptext
  belongs_to :user
end
