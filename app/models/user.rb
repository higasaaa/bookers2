class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # 1:Nの1側が削除されたとき、N側を全て削除する
  has_many :books, dependent: :destroy


  validates :name, length: { in: 2..20 }, uniqueness: true

   validates :introduction, length: { maximum: 50 }


  # profile画像をActiveStorageで保存できるようにする
  has_one_attached :profile_image

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
