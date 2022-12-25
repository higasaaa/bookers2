class Book < ApplicationRecord
    has_one_attached :image
    
    validates :title, presence: true 
    validates :body, presence: true, length: { maximum: 200 }
    
    # validates :introduction, length: { maximum: 50 }

    # ユーザーに属する（userに関連付ける記述）
    # has_many とは逆に、1:N の「N」側にあたるモデルに、belongs_to を記載する必要がある
    belongs_to :user
    
    
    
end
