# base Cookbook

* This is a cookbook with base LWRP provider. 
* It contains LWRP provider for setup base packages and do basic system configuration.
* default base LWRP contains reasonable defaults.
* Some features can be used independently, using sub-LWRP. Some of them have more attributes to configure. 

## Features

* set node hostname
* set system user
* set **.bash.d** folder for bash snippets, and include all ***.sh** files from the folder in .bashrc file.
* delete validation file for better security (use with caution)
* set host's timezone to UTC and configure host to do time sync every hour.
* install tmux and reasonable basic config for it.
* install emacs
* install git

## Requirements

### Platform

* Tested on Ubuntu 14.04

## Attributes
### base, default provider

<table>
  <tr>
    <th>Attribute</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>hostname</tt></td>
    <td>String</td>
    <td>Which hostname would you like for your host?</td>
    <td><tt>unassigned.local</tt></td>
  </tr>
  <tr>
    <td><tt>system_user</tt></td>
    <td>String</td>
    <td>specify a group for system user. Should correspond to the one of the groups in **groups** field in system user data (See: [Data bags](#data-bags))</td>
    <td><tt>devops</tt></td>
  </tr>
  <tr>
    <td><tt>bash_d</tt></td>
    <td>Boolean</td>
    <td>Should we install infra for .bash.d snippets for system user</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>delete_validation</tt></td>
    <td>Boolean</td>
    <td>Delete validation file from the host. Use with cautions</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>ntp</tt></td>
    <td>Boolean</td>
    <td>Installs ntp and enforce time sync every hour</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>tmux</tt></td>
    <td>Boolean</td>
    <td>Determine to install or not install tmux on a target system</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>tmux_prefix_key</tt></td>
    <td>String</td>
    <td>tmux prefix_key. It's up to you to change/set</td>
    <td><tt>C-z</tt></td>
  </tr>
  <tr>
    <td><tt>tmux_cookook</tt></td>
    <td>String</td>
    <td>Cookbook with tmux.conf.erb template. Change this value to this cookbook if you want to replace tmux.conf template to your own one.</td>
    <td><tt>base</tt></td>
  </tr>
  <tr>
    <td><tt>emacs</tt></td>
    <td>Boolean</td>
    <td>Install/Doesn't install emacs-nox</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>git</tt></td>
    <td>Boolean</td>
    <td>Install/doesn't install git</td>
    <td><tt>true</tt></td>
  </tr>

</table>

### base, bash_d provider
<table>
  <tr>
    <th>Attribute</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>user</tt></td>
    <td>String</td>
    <td>User who will get .bash.d snippets</td>
    <td>nil<tt></tt></td>
  </tr>
  <tr>
    <td><tt>snippet</tt></td>
    <td>String</td>
    <td>Snippet name, and at the same time .sh.erb template name (if template isn't specified)</td>
    <td><tt>nil</tt></td>
  </tr>
  <tr>
    <td><tt>cookbook</tt></td>
    <td>String</td>
    <td>Cookbook that contain snippet.sh.erb template</td>
    <td><tt>base</tt></td>
  </tr>
  <tr>
    <td><tt>template</tt></td>
    <td>String</td>
    <td>snippet template name</td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt></tt></td>
    <td></td>
    <td></td>
    <td><tt></tt></td>
  </tr>
</table>
### base, hostname provider
<table>
  <tr>
    <th>Attribute</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt> </tt></td>
    <td></td>
    <td></td>
    <td><tt></tt></td>
  </tr>
</table>
### base, ntp provider
<table>
  <tr>
    <th>Attribute</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt> </tt></td>
    <td></td>
    <td></td>
    <td><tt></tt></td>
  </tr>
</table>
### base, system_user provider
<table>
  <tr>
    <th>Attribute</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt> </tt></td>
    <td></td>
    <td></td>
    <td><tt></tt></td>
  </tr>
</table>
### base, tmux provider
<table>
  <tr>
    <th>Attribute</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt> </tt></td>
    <td></td>
    <td></td>
    <td><tt></tt></td>
  </tr>
</table>

## Data bags
Cookbook uses **users** data bag and users cookbook for setup system user.

* You need to create **devop.json** JSON file with similar structure:

```
{
  "id": "devop",
  "groups": [ "devops" ],
  "shell": "\/bin\/bash",
  "comment": "System user",
  "password": "$6$LJe018YObfgZRF$dEAPxJdRx2iFitC0LR7842NDjBSvnW4V6lIY1LhvyKPnQQMkrqya8psPTdBjBGS6dcJBZjyLIm8wdQJJMzoKt1",
  "ssh_keys": ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCriOsxymej+RLqGGJXhP0j5s06E0hA9GyORdZzzJx41roRUYcGwRVLYGhxtP+fKTXmNszEsuxYsyr0OQ7dwRjOEa+LOGPXx1JROzGU00tt3PuDvPMuFpjL0wuq754TsIWcTyDgiWdtd5vTHAdrTc0ZghNSFHNONqtLddQIE2p+YCfnmvBsrmRjt517m37ua87G7WNOiAqV/oDhO8CKfHDZuvRVHu77dFciIT0SXK+a0Xw7A3DbrkENWfRFA+OlmOafWrxSO705RC2S8SNSpIVX092KUYNGXhY3489F3VkHW1hBm2kOQUECnzkJGcbRajAjJZiBRnkOqSM3/aDPt7cL jakshi@gehilfe"]
}
```

to generate password hash for **password** field use command:

```
mkpasswd -m sha-512
```

* Add suitable ssh public keys in **ssh_keys** field
* Set name in **id** field and system user's group in **groups** field.

## Usage
### base, default provider

* Add base cookbook to your metadata.rb dependency, like:

```
depends 'base', '~> 0.2.7'
```

* Create and apply users data bag with system user. See: [Data bags](##data-bags).
* Add provider to your role cookbook, with hostname parameter, like:

```
base 'host.local'
```

* Switch on or switch off neccessary attributes, if defaults don't suit your needs. See: [base LWRP attributes](##attributes) for attributes description.

### base, bash_d provider
### base, hostname provider
### base, ntp provider
### base, system_user provider
### base, tmux provider

## Tests

## Contributing
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Author:: Atalanta Systems LTD (<cookbooks@atalanta-systems.com>)

Copyright 2013-2014, Atalanta Systems Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.