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
  context 'system_user attribute' do
    it 'creates devop user' do
      expect(user 'devop').to exist
    end
    it 'adds public ssh key to devop\'s user authorized_keys file' do
      expect(file '/home/devop/.ssh/authorized_keys').to contain 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCriOsxymej+RLqGGJXhP0j5s06E0hA9GyORdZzzJx41roRUYcGwRVLYGhxtP+fKTXmNszEsuxYsyr0OQ7dwRjOEa+LOGPXx1JROzGU00tt3PuDvPMuFpjL0wuq754TsIWcTyDgiWdtd5vTHAdrTc0ZghNSFHNONqtLddQIE2p+YCfnmvBsrmRjt517m37ua87G7WNOiAqV/oDhO8CKfHDZuvRVHu77dFciIT0SXK+a0Xw7A3DbrkENWfRFA+OlmOafWrxSO705RC2S8SNSpIVX092KUYNGXhY3489F3VkHW1hBm2kOQUECnzkJGcbRajAjJZiBRnkOqSM3/aDPt7cL'
    end
    it 'gives devop user passwordless sudo' do
      expect(file '/etc/sudoers').to contain '#includedir /etc/sudoers.d'
      expect(file '/etc/sudoers.d/devops').to contain '%devops  ALL=(ALL) NOPASSWD:ALL'
    end
  end
end
