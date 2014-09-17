class Question < ActiveRecord::Base
  validates :content, presence: true
  validates :title, presence: true
  belongs_to :user
  has_many :answers
  has_one :favorite
end
