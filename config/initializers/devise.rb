# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = '281bc283d4dc0128825b8671622283b1fa6eeb612ce600e263f996fd228ee6909f04824eb14d8408acc4b8cbd3029ac9c6deb1b439788f38df8c242fae71e3d3'

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = 'linelight.test@gmail.com'

  # configure the class responsible to send e-mails.
  # config.mailer = 'devise::mailer'

  # configure the parent class responsible to send e-mails.
  # config.parent_mailer = 'actionmailer::base'

  # ==> orm configuration
  # load and configure the orm. supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. other orms may be
  # available as additional gems.
  require 'devise/orm/active_record'

  # ==> configuration for any authentication mechanism
  # configure which keys are used when authenticating a user. the default is
  # just :email. you can configure it to use [:username, :subdomain], so for
  # authenticating a user, both parameters are required. remember that those
  # parameters are used only when authenticating and not when retrieving from
  # session. if you need permissions, you should implement that in a before filter.
  # you can also supply a hash where the value is a boolean determining whether
  # or not authentication should be aborted when the value is not present.
  # config.authentication_keys = [:email]

  # configure parameters from the request object used for authentication. each entry
  # given should be a request method and it will automatically be passed to the
  # find_for_authentication method and considered in your model lookup. for instance,
  # if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
  # the same considerations mentioned for authentication_keys also apply to request_keys.
  # config.request_keys = []

  # configure which authentication keys should be case-insensitive.
  # these keys will be downcased upon creating or modifying a user and when used
  # to authenticate or find a user. default is :email.
  config.case_insensitive_keys = [:email]

  # configure which authentication keys should have whitespace stripped.
  # these keys will have whitespace before and after removed upon creating or
  # modifying a user and when used to authenticate or find a user. default is :email.
  config.strip_whitespace_keys = [:email]

  # tell if authentication through request.params is enabled. true by default.
  # it can be set to an array that will enable params authentication only for the
  # given strategies, for example, `config.params_authenticatable = [:database]` will
  # enable it only for database (email + password) authentication.
  # config.params_authenticatable = true

  # tell if authentication through http auth is enabled. false by default.
  # it can be set to an array that will enable http authentication only for the
  # given strategies, for example, `config.http_authenticatable = [:database]` will
  # enable it only for database authentication. the supported strategies are:
  # :database      = support basic authentication with authentication key + password
  # config.http_authenticatable = false

  # if 401 status code should be returned for ajax requests. true by default.
  # config.http_authenticatable_on_xhr = true

  # the realm used in http basic authentication. 'application' by default.
  # config.http_authentication_realm = 'application'

  # it will change confirmation, password recovery and other workflows
  # to behave the same regardless if the e-mail provided was right or wrong.
  # does not affect registerable.
  # config.paranoid = true

  # by default devise will store the user in session. you can skip storage for
  # particular strategies by setting this option.
  # notice that if you are skipping storage for all authentication paths, you
  # may want to disable generating routes to devise's sessions controller by
  # passing skip: :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]

  # by default, devise cleans up the csrf token on authentication to
  # avoid csrf token fixation attacks. this means that, when using ajax
  # requests for sign in and sign up, you need to get a new csrf token
  # from the server. you can disable this option at your own risk.
  # config.clean_up_csrf_token_on_authentication = true

  # when false, devise will not attempt to reload routes on eager load.
  # this can reduce the time taken to boot the app but if your application
  # requires the devise mappings to be loaded during boot time the application
  # won't boot properly.
  # config.reload_routes = true

  # ==> configuration for :database_authenticatable
  # for bcrypt, this is the cost for hashing the password and defaults to 11. if
  # using other algorithms, it sets how many times you want the password to be hashed.
  #
  # limiting the stretches to just one in testing will increase the performance of
  # your test suite dramatically. however, it is strongly recommended to not use
  # a value less than 10 in other environments. note that, for bcrypt (the default
  # algorithm), the cost increases exponentially with the number of stretches (e.g.
  # a value of 20 is already extremely slow: approx. 60 seconds for 1 calculation).
  config.stretches = Rails.env.test? ? 1 : 11

  # set up a pepper to generate the hashed password.
  # config.pepper = 'a7fe4334e0d16c8702fcb4b5162594c391230f42649ecc6b81bb486dbc76f952c729983295ee7b48da06ad07d580a78d245fccd3c89c84d3fa82e8f6c221d594'

  # send a notification to the original email when the user's email is changed.
  # config.send_email_changed_notification = false

  # send a notification email when the user's password is changed.
  # config.send_password_change_notification = false

  # ==> configuration for :confirmable
  # a period that the user is allowed to access the website even without
  # confirming their account. for instance, if set to 2.days, the user will be
  # able to access the website for two days without confirming their account,
  # access will be blocked just in the third day. default is 0.days, meaning
  # the user cannot access the website without confirming their account.
  # config.allow_unconfirmed_access_for = 2.days

  # a period that the user is allowed to confirm their account before their
  # token becomes invalid. for example, if set to 3.days, the user can confirm
  # their account within 3 days after the mail was sent, but on the fourth day
  # their account can't be confirmed with the token any more.
  # default is nil, meaning there is no restriction on how long a user can take
  # before confirming their account.
  # config.confirm_within = 3.days

  # if true, requires any email changes to be confirmed (exactly the same way as
  # initial account confirmation) to be applied. requires additional unconfirmed_email
  # db field (see migrations). until confirmed, new email is stored in
  # unconfirmed_email column, and copied to email column on successful confirmation.
  config.reconfirmable = true

  # defines which key will be used when confirming an account
  # config.confirmation_keys = [:email]

  # ==> configuration for :rememberable
  # the time the user will be remembered without asking for credentials again.
  # config.remember_for = 2.weeks

  # invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true

  # if true, extends the user's remember period when remembered via cookie.
  # config.extend_remember_period = false

  # options to be passed to the created cookie. for instance, you can set
  # secure: true in order to force ssl only cookies.
  # config.rememberable_options = {}

  # ==> configuration for :validatable
  # range for password length.
  config.password_length = 6..128

  # email regex used to validate email formats. it simply asserts that
  # one (and only one) @ exists in the given string. this is mainly
  # to give user feedback and not to assert the e-mail validity.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> configuration for :timeoutable
  # the time you want to timeout the user session without activity. after this
  # time the user will be asked for credentials again. default is 30 minutes.
  config.timeout_in = 30.minutes

  # ==> configuration for :lockable
  # defines which strategy will be used to lock an account.
  # :failed_attempts = locks an account after a number of failed attempts to sign in.
  # :none            = no lock strategy. you should handle locking by yourself.
  # config.lock_strategy = :failed_attempts

  # defines which key will be used when locking and unlocking an account
  # config.unlock_keys = [:email]

  # defines which strategy will be used to unlock an account.
  # :email = sends an unlock link to the user email
  # :time  = re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = enables both strategies
  # :none  = no unlock strategy. you should handle unlocking by yourself.
  config.unlock_strategy = :email

  # number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  config.maximum_attempts = 10

  # time interval to unlock the account if :time is enabled as unlock_strategy.
  # config.unlock_in = 1.hour

  # warn on the last attempt before the account is locked.
  # config.last_attempt_warning = true

  # ==> configuration for :recoverable
  #
  # defines which key will be used when recovering the password for an account
  # config.reset_password_keys = [:email]

  # time interval you can reset your password with a reset password key.
  # don't put a too small interval or your users won't have the time to
  # change their passwords.
  config.reset_password_within = 6.hours

  # when set to false, does not sign a user in automatically after their password is
  # reset. defaults to true, so a user is signed in automatically after a reset.
  # config.sign_in_after_reset_password = true

  # ==> configuration for :encryptable
  # allow you to use another hashing or encryption algorithm besides bcrypt (default).
  # you can use :sha1, :sha512 or algorithms from others authentication tools as
  # :clearance_sha1, :authlogic_sha512 (then you should set stretches above to 20
  # for default behavior) and :restful_authentication_sha1 (then you should set
  # stretches to 10, and copy rest_auth_site_key to pepper).
  #
  # require the `devise-encryptable` gem when using anything other than bcrypt
  # config.encryptor = :sha512

  # ==> scopes configuration
  # turn scoped views on. before rendering "sessions/new", it will first check for
  # "users/sessions/new". it's turned off by default because it's slower if you
  # are using only default views.
  config.scoped_views = true

  # configure the default scope given to warden. by default it's the first
  # devise role declared in your routes (usually :user).
  # config.default_scope = :user

  # set this configuration to false if you want /users/sign_out to sign out
  # only the current scope. by default, devise signs out all scopes.
  # config.sign_out_all_scopes = true

  # ==> navigation configuration
  # lists the formats that should be treated as navigational. formats like
  # :html, should redirect to the sign in page when the user does not have
  # access, but formats like :xml or :json, should return 401.
  #
  # if you have any extra navigational formats, like :iphone or :mobile, you
  # should add them to the navigational formats lists.
  #
  # the "*/*" below is required to match internet explorer requests.
  # config.navigational_formats = ['*/*', :html]

  # the default http method used to sign out a resource. default is :delete.
  config.sign_out_via = :delete

  # ==> omniauth
  # add a new omniauth provider. check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'app_id', 'app_secret', scope: 'user,public_repo'

  # ==> warden configuration
  # if you want to use other strategies, that are not supported by devise, or
  # change the failure app, you can configure them inside the config.warden block.
  #
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # ==> mountable engine configurations
  # when using devise inside an engine, let's call it `myengine`, and this engine
  # is mountable, there are some extra configurations to be taken into account.
  # The following options are available, assuming the engine is mounted as:
  #
  #     mount MyEngine, at: '/my_engine'
  #
  # The router that invoked `devise_for`, in the example above, would be:
  # config.router_name = :my_engine
  #
  # When using OmniAuth, Devise cannot automatically set OmniAuth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
