require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LineLight
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # デフォルトのテンプレートエンジンをslimに変更
    config.generators.template_engine = :slim
    # Timezoneを日本時間に変更
    config.time_zone = 'Tokyo'
    # ActiveRecord使用時にDBに書かれる時刻も日本時間に
    config.active_record.default_timezone = :local
    # deviseの日本語化
    config.i18n.default_locale = :ja

    config.assets.initialize_on_precompile = false
  end
end
