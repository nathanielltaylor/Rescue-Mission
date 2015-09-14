class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates :body, presence: true
  validates :title, presence: true
  validates :user, presence: true
  validates :question, presence: true
end
