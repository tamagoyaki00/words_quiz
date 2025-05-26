class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :choice

  validates :choice_id, presence: true
end
