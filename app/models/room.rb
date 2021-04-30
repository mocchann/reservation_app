class Room < ApplicationRecord
  belongs_to :maker, class_name: "User", foreign_key: "user_id" # 名前をmakerに変更して、Userレコードを取得できる
  has_many :reservations, dependent: :destroy
  has_many :appointers, through: :reservations, source: :user # userモデルでも同じ記述あり
  
  validates :name, presence: true
  validates :description, presence: true
  
  has_one_attached :room_img
  attribute :new_room_img
  
  before_save do
    if new_room_img
      self.room_img = new_room_img
    end
  end
  
end
