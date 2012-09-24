===============
puppet-htpasswd
===============

A simple puppet module to handle htpasswd command line tool


example
=======

htpasswd::user {'username':
    file => '/path_to_my_file'
    password => 'username_password'
}

