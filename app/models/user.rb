class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  has_many :messages, dependent: :destroy
  has_many :friendships_of_from, class_name: "Friend", foreign_key: :from_user_id, dependent: :destroy
  has_many :friends_of_from_user, through: :friendships_of_from, source: 'to_user'
  has_many :friendships_of_to, class_name: "Friend", foreign_key: :to_user_id, dependent: :destroy
  has_many :friends_of_to_user, through: :friendships_of_to, source: 'from_user'

  def follow(target)
    Friend.create(from_user_id: self.id, to_user_id: target.id)
  end

  def block(target)
    Friend.find_by(from_user_id: self.id, to_user_id: target.id).destroy
  end

  def friends
    friends = []
    user  = self
    self.friends_of_from_user do |follow_user|
      if follow_user.friends_of_from_user.include?(user)
        friends << follow_user
      end
    end
  end

  def friend_with?(target)
    if User.find_by(id: target.id)
      self.friends_of_from_user.all.include?(target) && self.friends_of_to_user.all.include?(target)
    end
  end
end
