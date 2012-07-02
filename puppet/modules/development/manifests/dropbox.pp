class development::dropbox {

  $packagedir = "../../packages/ubuntu"

  package { 'dropbox':
    ensure => installed,
    source => "${packagedir}/dropbox_1.0_i386.deb",
    provider => 'dpkg',
  }

}
