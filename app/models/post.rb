class Post < ApplicationRecord

  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }

  validates :text, presence: true, length: { minimum: 3, maximum: 100 }
  
end
