class PersonalMessage < ApplicationRecord
  belongs_to :friend
  validates :friend, presence: true

  after_create_commit { PersonalMessageBroadcastJob.perform_later self }
end
