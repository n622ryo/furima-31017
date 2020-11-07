class Item < ApplicationRecord
  #userとのアソシエーション
  belongs_to :user
  #imageとのアソシエーション
  has_one_attached :image

  #ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :deliveryday

  validates :image, presence: true
  validates :product, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category_id, presence: true,numericality: { other_than: 1 } 
  validates :status_id, presence: true, numericality: { other_than: 1 } 
  validates :burden_id, presence: true, numericality: { other_than: 1 } 
  validates :area_id, presence: true, numericality: { other_than: 1 } 
  validates :deliveryday_id, presence: true, numericality: { other_than: 1 } 

end
