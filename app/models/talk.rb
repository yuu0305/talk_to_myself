class Talk < ApplicationRecord
  validates :text , presence: true
  belongs_to :folder ,optional: true
end
