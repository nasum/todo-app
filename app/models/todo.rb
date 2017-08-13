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
#
# Indexes
#
#  index_todos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :expired_at, presence: true
end
