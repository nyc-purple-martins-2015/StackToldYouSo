require 'rails_helper'

RSpec.describe Comment do

  it { is_expected.to validate_presence_of :note }
  it { is_expected.to validate_presence_of :commentable_type }
  it { is_expected.to validate_presence_of :commentable_id } 

end
