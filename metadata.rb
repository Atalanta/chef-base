name             'base'
maintainer       'Atalanta Systems Ltd'
maintainer_email 'support@atalanta-systems.com'
license          'Apache 2.0'
description      'Installs/Configures base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'
%w{ selinux }.each do |cb|
  depends cb
end
