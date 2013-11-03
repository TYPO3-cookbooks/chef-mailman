#
# Cookbook Name:: mailman
# Recipe:: lists
#
# Copyright 2013, Steffen Gebert / TYPO3 Association
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

lists = [
{
  :name => "typo3-english",
  :email => node[:mailman][:email],
  :password => "123"
},
{
  :name => "typo3-german",
  :email => node[:mailman][:email],
  :password => "456"
}
]

lists.each do |list|
  mailman_list list[:name] do
    email list[:email]
    password list[:password]
    notifies :start, resources(:service => "mailman")
    provider "mailman_#{node[:mailman][:mta]}"
  end
end
