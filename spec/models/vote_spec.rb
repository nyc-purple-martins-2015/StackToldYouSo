require 'rails_helper'

RSpec.describe Vote do

  it { is_expected.to validate_presence_of :user_id }
  it { is_expected.to validate_presence_of :value }
  it { is_expected.to validate_presence_of :votable_type }
  it { is_expected.to validate_presence_of :votable_id }

end
