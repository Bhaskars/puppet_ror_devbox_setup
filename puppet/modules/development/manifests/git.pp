class development::git {

  package { "git":
    ensure => installed,
  }

  package { "git-core":
    ensure => installed,
  }


  package { "gitg":
     ensure => installed,
  }

   exec { "git-set-sslverify-false":
     command => "/usr/bin/git config --global http.sslverify false",
     path    => "/bin:/usr/bin:/usr/local/bin",
     unless => "/usr/bin/test `/usr/bin/git config --global --get http.sslverify` = 'false'",
   }

   exec {"git-password-caching":
     command => "/usr/bin/git config --global credential.helper 'cache --timeout=3600'",
     path    => "/bin:/usr/bin:/usr/local/bin",

    }

   exec { "git-meld":
     command => "/usr/bin/apt-get install meld",
     }

    exec { "git-meld-config":
      command => "git config --global diff.external meld",
      path    => "/bin:/usr/bin:/usr/local/bin",
      require => Exec["git-meld"],
      }


}
