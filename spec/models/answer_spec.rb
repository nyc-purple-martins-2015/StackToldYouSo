require 'rails_helper'

RSpec.describe Answer do

  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :question_id }
  it { is_expected.to validate_presence_of :user_id } 

end
