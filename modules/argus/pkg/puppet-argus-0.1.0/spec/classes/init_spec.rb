require 'spec_helper'
describe 'argus' do

  context 'with defaults for all parameters' do
    it { should contain_class('argus') }
  end
end
