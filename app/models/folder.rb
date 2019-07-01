class Folder < ApplicationRecord
    has_many :talks , dependent: :destroy
    validates :name , presence: true
    validates :name,    length: { maximum: 25 }      # 「25文字以下」
end
