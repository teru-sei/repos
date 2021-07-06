class Cafe < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :address
    validates :recommend
    validates :user_id
  end

  belongs_to :user
  #has_many :comments
  #has_many :likes
  has_one_attached :image
end
