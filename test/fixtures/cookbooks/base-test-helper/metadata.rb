# -*- encoding : utf-8 -*-
name             'base-test-helper'
maintainer       'Atalanta Systems Ltd'
maintainer_email 'support@atalanta-systems.com'
license          'Apache 2.0'
description      'Cookbook for testing base LWRP'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe 'default', 'calls base LWRP for testing purposes'

%w{ ubuntu debian }.each do |os|
  supports os
end

depends 'base'
