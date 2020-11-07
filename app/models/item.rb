class Item < ApplicationRecord
  #通常のアソシエーション
  belongs_to :user
  has_one_attached :image

  #ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :deliveryday

  validates :image, presence: true

end
