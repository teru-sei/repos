class Cafe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purpose
  belongs_to :prefecture

  with_options presence: true do
    validates :image
    validates :name
    validates :address
    validates :recommend
    validates :user_id

    with_options numericality: { other_tham: 1 } do
      validates :purpose_id
      validates :prefecture_id
    end
  end

  belongs_to :user
  #has_many :comments
  #has_many :likes
  has_one_attached :image

  def self.search(seach)
  end
end
