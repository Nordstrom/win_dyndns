#
# Copyright (c) 2015 Nordstrom, Inc.
#

name             'win_dyndns'
maintainer       'EPG WSE Team'
maintainer_email 'itwseall@nordstrom.com'
license          'all_rights'
description      'Configures Windows dynamic DNS registration setting'
version          '0.1.1'

depends 'windows', '~> 1.38'
depends 'wse_powershell_helper', '~> 0.1'
