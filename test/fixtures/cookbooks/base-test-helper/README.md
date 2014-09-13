base-test-helper Cookbook
============================

This a cookbook for testing base cookbook LWRP

Requirements
------------

### OS

* Ubuntu 14.04 LTS

Attributes
----------

Usage
-----
#### base-test-helper::default

Include `base-test-helper` in your test-kitchen .kitchen.yml like:

```
suites:
- name: server
  run_list:
  - recipe[base-test-helper]
  - recipe[base] 
```

# Author

Author:: Lysenko Konstantin (<konstantin@atalanta-systems.com>)
