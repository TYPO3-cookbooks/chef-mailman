name             "mailman"
maintainer       "computerlyrik + TYPO3"
maintainer_email "chef-cookbooks@computerlyrik.de"
license          "Apache 2.0"
description      "Installs/Configures mailman"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.9.5"

depends "openssl"
depends "apache2"
depends "postfix"