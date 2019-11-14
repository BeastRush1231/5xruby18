class Todotask < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  belongs_to :user
end
