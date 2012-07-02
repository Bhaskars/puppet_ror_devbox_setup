class development::rvm {
  include rvm
  $uni_ruby_version = "ruby-1.9.3-p125"
  $uni_gemset = "unisporkal"
  $full_gemset_name = "${uni_ruby_version}@${uni_gemset}"

  #Package { ensure => installed, }
  #package { "libyaml": }
  #package { "libyaml-devel": }

  rvm_system_ruby { "$uni_ruby_version":
    ensure      => present,
    default_use => true,
  }

  rvm_gemset { $full_gemset_name:
    ensure  => present,
    require => Rvm_system_ruby[$uni_ruby_version],
  }

  Rvm_gem {
    ensure        => latest,
    ruby_version  => $uni_ruby_version,
    require       => Rvm_gemset["${full_gemset_name}"],
  }

  rvm_gem { "${full_gemset_name}/bundler": }
  rvm_gem { "${full_gemset_name}/rake": }

  # need to source the file      source /etc/profile

  #Package["libyaml", "libyaml-devel"] -> Rvm_system_ruby[$uni_ruby_version]
  Rvm_system_ruby[$uni_ruby_version] -> Rvm_gemset[$full_gemset_name]
  Rvm_gemset[$full_gemset_name] -> Rvm_gem["${full_gemset_name}/bundler"]
  Rvm_gemset[$full_gemset_name] -> Rvm_gem["${full_gemset_name}/rake"]

}

