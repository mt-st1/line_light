class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  has_many :users, class_name: "Friend", foreign_key: :user_id, dependent: :destroy
  has_many :friends_of_user, through: :users, source: 'target'
  has_many :targets, class_name: "Friend", foreign_key: :target_id, dependent: :destroy
  has_many :friends_of_target, through: :targets, source: 'user'

  def follow(target)
    users.create(target_id: target.id)
  end

  def block(target)
    users.find_by(target_id: target.id).destroy
  end

  def friend?(target)
    target_user = User.find_by(id: target.id)
    friends_of_user.include?(target) && target_user.friends_of_target.include?(self)
  end
end
