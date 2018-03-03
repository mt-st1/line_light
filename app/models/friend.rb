class Friend < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :target, class_name: "User"
  validates :user_id, presence: true
  validates :user_id, presence: true
end
