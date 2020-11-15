class ItemOrder

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :housenum, :buildname, :phonenum

# ここにバリデーションの処理を書く
  with_options presence: true do
    validates :phonenum, format: {with: /\A\d{10,11}\z/ }
    validates :city
    validates :housenum
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
  end


  def save
    # 各テーブルにデータを保存する処理を書く
    user = User.find(params[:id])
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, housenum: housenum, buildname: buildname, phonenum: phonenum, user_id: user.id)
    Order.create(item_id: item.id, user_id: user.id)
  end
end