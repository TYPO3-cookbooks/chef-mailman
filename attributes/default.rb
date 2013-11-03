default[:mailman][:mailman_email] = "listmaster@#{node[:domain]}"
default[:mailman][:mailman_password] = nil
default[:mailman][:hostname] = "lists.#{node[:domain]}"
default[:mailman][:mta] = "postfix"

default[:mailman][:list_creator] = nil
default[:mailman][:site_pass] = nil

default[:mailman][:home] = "/var/lib/mailman"
default[:mailman][:user] = "list"
default[:mailman][:group] = "list"

# these are the Debian Wheezy defaults
default[:mailman][:config] = {
  "MAILMAN_SITE_LIST"       => "mailman",
  "DEFAULT_URL_PATTERN"     => "http://%s/cgi-bin/mailman/",
  "IMAGE_LOGOS"             => "/images/mailman/",
  "DEFAULT_EMAIL_HOST"      => node[:mailman][:hostname],
  "DEFAULT_URL_HOST"        => node[:mailman][:hostname],
  "DEFAULT_SERVER_LANGUAGE" => "en",
  "USE_ENVELOPE_SENDER"     => 0,
  "DEFAULT_SEND_REMINDERS"  => 0,
}


# TYPO3 :-)
default[:mailman][:hostname] = "lists.typo3.org"
default[:mailman][:email]    = "mailman-owner@#{node[:mailman][:hostname]}"
default[:mailman][:config] = {
  "DEFAULT_HOST_NAME"       => node[:mailman][:hostname],
  "DEFAULT_URL"             => "http://#{node[:mailman][:hostname]}/cgi-bin/mailman/",
  "DEFAULT_EMAIL_HOST"      => node[:mailman][:hostname],
  "DEFAULT_URL_HOST"        => node[:mailman][:hostname],
  "SMTPPORT"                => 25,
  "IMAGE_LOGOS"             => "/images/mailman/",
  "USE_ENVELOPE_SENDER"     => 0,
  "DEFAULT_SEND_REMINDERS"  => 0,
  "MAILMAN_OWNER"           => node[:mailman][:email],
  "PRIVATE_ARCHIVE_URL"     => "/cgi-bin/mailman/private",
  "SMTP_MAX_SESSIONS_PER_CONNECTION" => 80,
  "DEFAULT_SERVER_LANGUAGE" => "en",
  "MTA"                     => "Postfix",
  "POSTFIX_STYLE_VIRTUAL_DOMAINS" => ["lists.typo3.org", "lists.netfielders.de"],
}