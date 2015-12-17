require 'spec_helper'
describe 'develop' do

  context 'with defaults for all parameters' do
    it { should contain_class('develop') }
  end
end
