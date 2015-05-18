node 'db' {
include sudo
include mysql
include bacula-file
}
node 'app' {
include sudo
include bacula-file
}

node 'storage' {
include sudo
include bacula-file
include bacula-storage
}
node 'mgmt'
{
include nagios
include sudo
include bacula-file
include bacula-director
}
