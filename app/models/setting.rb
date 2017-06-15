class Setting < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true

  validates :country, length: { minimum: 2 }
  validates :language, length: { minimum: 2 }

end
