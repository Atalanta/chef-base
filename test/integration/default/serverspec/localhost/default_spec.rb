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
  context 'emacs attribute' do
    it 'installs emacs' do
      expect(command 'emacs --version').to return_stdout /GNU\ Emacs/
    end
  end
  context 'git attribute' do
    it 'installs git' do
      expect(command 'git --version').to return_stdout /git\ version/
    end
  end
  context 'tmux attribute' do
    it 'installs tmux' do
      expect(command 'tmux -V').to return_stdout /tmux\ 1\./
    end
  end

end
