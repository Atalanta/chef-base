require 'spec_helper'

describe 'base cookbook LWRP' do
  context 'hostname attribute' do
    it 'sets instance hostname' do
      expect(command 'hostname').to return_stdout /test/
    end
    it 'sets premanent hostname' do
      expect(file '/etc/hostname').to contain 'test'
    end
    it 'sets fqdn to test.local' do
      expect(file '/etc/hosts').to contain 'test.example.com'
    end
  end
end
