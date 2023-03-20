# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  status                 :integer          default("active")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email(name: "#{first_name}_#{last_name}") }
    password { Faker::Internet.password(min_length: 8) }

    trait :admin do
      first_name { 'Admin' }
      last_name { 'User' }
      email { Faker::Internet.email(name: 'admin_user') }
      after(:build) do |admin_user|
        admin_user.add_role(:admin)
      end
    end

    # trait :blocked do
    #   status { 'blocked' }
    # end
  end
end
