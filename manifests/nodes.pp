node 'db' {
include sudo
include mysql
include nagios
package { 'vim': ensure => present }
}
node 'app' {
include sudo
package { 'vim': ensure => present }
}

node 'storage' {
include sudo
package { 'vim': ensure => present }
}
node 'mgmt'
{
include nagios
include sudo
}
