require 'rails_helper'

RSpec.describe Tag do

  it { is_expected.to validate_presence_of :description }

end
