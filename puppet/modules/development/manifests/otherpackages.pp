class development::otherpackages {

   notify { "base packages installed:: $name" :}
     $base_packages = [
               "vim",
                "openssh-server",
                "thunderbird",
                "pidgin",
                "gimp",
                "nodejs",
                "meld",
                "Dropbox",
                "network-manager-vpnc",
                "libqt4-dev",
                "libqtwebkit-dev",
                "xvfb",
                "google-chrome-stable",

        ]

        package { $base_packages:
                ensure => installed
        }

}