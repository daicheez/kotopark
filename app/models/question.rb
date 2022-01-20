class Question < ApplicationRecord
  belongs_to :training
  has_many :choices
end
