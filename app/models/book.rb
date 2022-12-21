class Book < ApplicationRecord
    # has_one_attached :image

    # ユーザーに属する（userに関連付ける記述）
    # has_many とは逆に、1:N の「N」側にあたるモデルに、belongs_to を記載する必要がある
    belongs_to :user
    
    
    
end
