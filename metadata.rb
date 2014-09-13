name             'base'
maintainer       'Atalanta Systems Ltd'
maintainer_email 'support@atalanta-systems.com'
license          'Apache 2.0'
description      'Installs/Configures base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.5'

%w{debian ubuntu}.each do |os|
  supports os
end

depends 'hostsfile', '~> 2.4.5'

# %w{ sudo user chef-client selinux }.each do |cb|
#   depends cb
# end
