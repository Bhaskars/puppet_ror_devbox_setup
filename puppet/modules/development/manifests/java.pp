class development::java {

   exec { "add-java-source":
     command => "/usr/bin/add-apt-repository ppa:webupd8team/java",
     notify => Exec['update-apt-get'],
     refreshonly => true,
   }

   exec { "update-apt-get":
      command => "/usr/bin/apt-get update",
       notify => Exec['install-sun-jdk']
    }

   exec { "install-sun-jdk":
      command => "/usr/bin/apt-get install oracle-java7-installer",
      #subscribe => Exec["update-apt-get"]
   }

}