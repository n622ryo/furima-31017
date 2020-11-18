class Item < ApplicationRecord
  #userとのアソシエーション
  belongs_to :user
  #imageとのアソシエーション
  has_one_attached :image
  #orderとのアソシエーション
  has_one :order

  #ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :deliveryday

  with_options presence: true do
    validates :image
    validates :product
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :burden_id
      validates :area_id
      validates :deliveryday_id
    end
  end
end
