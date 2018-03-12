module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    # 接続してきたユーザーが許可するべきユーザーかどうか判定して、接続を確立
    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user.email
    end

    protected

    def find_verified_user
      if (verified_user = User.find_by_id cookies.signed['user.id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
