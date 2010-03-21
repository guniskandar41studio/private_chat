# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  login               :string(255)     not null
#  email               :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer         default(0), not null
#  failed_login_count  :integer         default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  cached_slug         :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#
Factory.define :admin, :class => User do |u|
  u.login      'admin'
  u.email      'admin@example.com'
  u.password   'monkey'
  u.password_confirmation 'monkey'
end

Factory.define :quentin, :class => User do |u|
  u.login      'quentin'
  u.email      'quentin@example.com'
  u.password   'monkey'
  u.password_confirmation 'monkey'
end

Factory.define :aaron, :class => User do |u|
  u.login      'aaron'
  u.email      'aaron@example.com'
  u.password   'monkey'
  u.password_confirmation 'monkey'
end
