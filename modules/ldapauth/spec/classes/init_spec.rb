require 'spec_helper'
describe 'ldapauth' do

  context 'with defaults for all parameters' do
    it { should contain_class('ldapauth') }
  end
end
