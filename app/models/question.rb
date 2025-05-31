class Question < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  has_many :answers

  validates :term, presence: true
end
