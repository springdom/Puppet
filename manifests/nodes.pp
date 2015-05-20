node 'db' {
include sudo
include mysql
include bacula-file
include nrpe
}
node 'app' {
include sudo
include bacula-file
include nrpe
}

node 'storage' {
include sudo
include bacula-file
include bacula-storage
include nrpe
}
node 'mgmt'
{
include nagios
include sudo
include bacula-file
include bacula-director
include nrpe
}
node 'ad'
{
include host_file
}
