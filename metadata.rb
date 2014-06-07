maintainer       "Nathan Mische"
maintainer_email "nmische@gmail.com"
license          "Apache 2.0"
description      "Installs viratualenvwrapper."
name             "virtualenvwrapper"
version          "0.0.1"

%w{ ubuntu centos }.each do |p|
    supports p
end

%w{ python yum }.each do |d|
   depends d
end

recipe "default", "Installs the virtualenvwrapper via pip."
recipe "package", "Installs the virtualenvwrapper via package."
recipe "pip", "Installs the virtualenvwrapper via pip."
