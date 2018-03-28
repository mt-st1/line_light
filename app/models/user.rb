class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  has_many :messages, dependent: :destroy
  has_many :from_friendships, class_name: "Friend", foreign_key: :from_user_id, dependent: :destroy
  has_many :follows, through: :from_friendships, source: 'to_user'
  has_many :to_friendships, class_name: "Friend", foreign_key: :to_user_id, dependent: :destroy
  has_many :followers, through: :to_friendships, source: 'from_user'

  def follow(target)
    if self.id != target.id
      Friend.create(from_user_id: self.id, to_user_id: target.id)
    end
  end

  def block(target)
    Friend.find_by(from_user_id: self.id, to_user_id: target.id).destroy
  end

  def deep_block(target)
    self.block(target)
    Friend.find_by(from_user_id: target.id, to_user_id: self.id).destroy
  end

  def friends
    friends = []
    self.follows.each do |follow_user|
      if follow_user.follows.include?(self)
        friends << follow_user
      end
    end
    friends
  end

  def friend_with?(target)
    if User.find_by(id: target.id)
      self.follows.include?(target) && self.followers.include?(target)
    end
  end

  def requesting_users
    requesting_users = []
    self.follows.each do |follow_user|
      if not follow_user.follows.include?(self)
        requesting_users << follow_user
      end
    end
    requesting_users
  end

  def requested_users
    requested_users = []
    self.followers.each do |followed_user|
      if not self.follows.include?(followed_user)
        requested_users << followed_user
      end
    end
    requested_users
  end
end
