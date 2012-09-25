===============
puppet-htpasswd
===============

A simple puppet module to handle htpasswd command line tool


examples
========

Create or updating an entry on the auth file
::
    package{'apache2-utils': ensure => installed }   
 
    htpasswd::user {"username":
        file => '/path_to_my_file',
        password => 'username_password'
    }
    

Deleting an user
::
     package{'apache2-utils': ensure => installed }      
    
     htpasswd::user {"username":
        file => '/path_to_my_file',
        ensure => absent
    }
    

Controling the encryptation, options are(`md5`, `sha`, `plain`, `crypt`)
::
    package{'apache2-utils': ensure => installed }   
    
    htpasswd::user {"username":
        file => '/path_to_my_file',
        ensure => present,
        encryptation => sha
    }
      


