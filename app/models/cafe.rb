class Cafe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purpose
  belongs_to :prefecture

  with_options presence: true do
    validates :image
    validates :name
    validates :address
    validates :recommend, length: { maximum: 100 }

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :purpose_id
      validates :prefecture_id
    end
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
  # has_many :likes
  has_one_attached :image

  def self.search(_search)
    Cafe.all
  end
end
