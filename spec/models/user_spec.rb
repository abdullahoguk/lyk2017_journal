# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string           not null
#  role            :integer          default("0")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :role }
  it { should allow_value("aasad@sdsda.com").for(:email) }
  it { should_not allow_value("aasadsdsda.com").for(:email) }

end
