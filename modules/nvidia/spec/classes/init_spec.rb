require 'spec_helper'
describe 'nvidia' do

  context 'with defaults for all parameters' do
    it { should contain_class('nvidia') }
  end
end
