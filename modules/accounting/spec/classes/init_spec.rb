require 'spec_helper'
describe 'accounting' do

  context 'with defaults for all parameters' do
    it { should contain_class('accounting') }
  end
end
