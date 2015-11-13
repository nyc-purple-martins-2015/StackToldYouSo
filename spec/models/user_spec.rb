require 'rails_helper'

RSpec.describe User do
  let(:user) { FactoryGirl.build(:user) }

  it { is_expected.to validate_presence_of :username }
  it { is_expected.to validate_presence_of :password }

end
