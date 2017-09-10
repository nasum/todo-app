# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  expired_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default("default"), not null
#
# Indexes
#
#  index_todos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryGirl.define do
  factory :todo do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    expired_at { "2017-08-12 23:36:17" }

    association :user, factory: :user
  end
end
