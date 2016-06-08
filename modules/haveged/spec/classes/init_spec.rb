require 'spec_helper'
describe 'haveged' do

  context 'with defaults for all parameters' do
    it { should contain_class('haveged') }
  end
end
