require 'spec_helper'
describe 'intel' do

  context 'with defaults for all parameters' do
    it { should contain_class('intel') }
  end
end
