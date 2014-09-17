class Answer < ActiveRecord::Base
  validates :content, presence: true
  validates :user_id, presence: true
  validates :question_id, presence: true
  belongs_to :question
  belongs_to :user
  has_one :favorite
end
