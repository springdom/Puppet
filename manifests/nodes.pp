node 'db' {
include sudo
include mysql
include nagios
include bacula-file
package { 'vim': ensure => present }
}
node 'app' {
include sudo
include bacula-file
package { 'vim': ensure => present }
}

node 'storage' {
include sudo
include bacula-file
package { 'vim': ensure => present }
include bacula-storage
}
node 'mgmt'
{
include nagios
include sudo
include bacula-file
include bacula-director
}
