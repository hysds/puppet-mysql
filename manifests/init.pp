#####################################################
# mysql class
#####################################################

class mysql {

  #####################################################
  # install packages
  #####################################################

  package {
    'mariadb-server': ensure => installed;
    'mariadb': ensure => installed;
    'mariadb-devel': ensure => installed;
    'mariadb-libs': ensure => installed;
    'mysql-connector-python': ensure => installed;
  }


  #####################################################
  # refresh ld cache
  #####################################################

  if ! defined(Exec['ldconfig']) {
    exec { 'ldconfig': 
      command     => '/sbin/ldconfig',
      refreshonly => true, 
    }
  } 


  #####################################################
  # mysql service
  #####################################################

  service { 'mariadb':
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus => true,
    require => Package['mariadb-server'],
  }


}
