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


  exec { "mariadb-start":
    path    => ["/bin", "/usr/bin"],
    command => "mysqld_safe",
    require => Package["mariadb-server"],
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


}
