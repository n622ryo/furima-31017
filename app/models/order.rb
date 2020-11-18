class Order < ApplicationRecord
  #addressとのアソシエーション
  has_one :address
  #itemとのアソシエーション
  belongs_to :item
  #userとのアソシエーション
  belongs_to :user

end
