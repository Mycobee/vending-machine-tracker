require 'rails_helper'

RSpec.describe Snack, type: :model do
    describe 'validations' do
        it { should belong_to :machine}
    end
end