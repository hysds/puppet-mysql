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
    'mysql-libs': ensure => installed;
    'python3-mysqlclient': ensure => installed;
  }


  exec { "mysql-start":
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
