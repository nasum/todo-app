# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid' do
    context 'correct input' do
      let(:user) { build(:user) }
      it { expect(user).to be_valid }
    end

    context 'nothing email' do
      let(:user) { build(:user, email: '') }
      it { expect(user).not_to be_valid }
    end

    context 'nothing password' do
      let(:user) { build(:user, password: '') }
      it { expect(user).not_to be_valid }
    end
  end
end
