# -*- encoding : utf-8 -*-
name             'base'
maintainer       'Atalanta Systems Ltd'
maintainer_email 'support@atalanta-systems.com'
license          'Apache 2.0'
description      'Installs/Configures base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.8'

supports 'ubuntu', ">= 14.04"

depends 'hostsfile', '~> 2.4.5'
depends 'users', '~> 1.7.0'
depends 'sudo', '~> 2.7.0'
depends 'chef-client', '~> 3.8.0'
