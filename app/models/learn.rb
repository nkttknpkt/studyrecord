class Learn < ApplicationRecord
  belongs_to :user
  
  validates :date, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 155 }
  validates :note, presence: true, length: { maximum: 255 }
end
