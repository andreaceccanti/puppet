require 'spec_helper'
describe 'lsf' do

  context 'with defaults for all parameters' do
    it { should contain_class('lsf') }
  end
end
