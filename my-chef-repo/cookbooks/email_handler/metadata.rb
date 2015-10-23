name             'email_handler'
maintainer       'Sundar Rajan'
maintainer_email 'chef@localhost'
license          'Apache 2.0'
description      'Email me on every Chef run'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "chef_handler"
depends "postfix"
depends "mailx"
