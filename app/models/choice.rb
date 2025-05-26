class Choice < ApplicationRecord
  belongs_to :question
  has_many :answers

  validates :content, presence: true

  def correct_answer?
    correct
  end
end
