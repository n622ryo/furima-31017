class Address < ApplicationRecord
  #orderとのアソシエーション
  belongs_to :order

  #ActiveHashとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :postcode
    validates :city
    validates :housenum
    validates :phonenum
    validates :phonenum

    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
  end
end
