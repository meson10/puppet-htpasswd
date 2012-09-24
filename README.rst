===============
puppet-htpasswd
===============

A simple puppet module to handle htpasswd command line tool


examples
========

Create or updating an entry on the auth file
::
    
    htpasswd::user {"username":
        file => '/path_to_my_file',
        password => 'username_password'
    }
    

Deleting an user
::
    
     htpasswd::user {"username":
        file => '/path_to_my_file',
        ensure => absent
    }
    

Controling the encryptation, options are(`md5`, `sha`, `plain`, `crypt`)
::
    
      htpasswd::user {"username":
        file => '/path_to_my_file',
        ensure => absent,
        encryptation => 'sha'
    }
      


