class Ptext < ActiveRecord::Base
  has_many :stexts, dependent: :destroy
  belongs_to :user

end
