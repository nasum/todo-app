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

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe '#save' do
    context 'valid input' do
      let(:todo) { build(:todo) }
      it { expect(todo.save).to be_truthy }
    end

    context 'no title' do
      let(:todo) { build(:todo, title: '') }
      it { expect(todo.save).to be_falsey }
    end

    context 'no expired_at' do
      let(:todo) { build(:todo, expired_at: '') }
      it { expect(todo.save).to be_falsey }
    end
  end
end
