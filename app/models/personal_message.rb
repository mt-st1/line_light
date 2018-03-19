class PersonalMessage < ApplicationRecord
  belongs_to :friend
  validates :friend, presence: true
end
