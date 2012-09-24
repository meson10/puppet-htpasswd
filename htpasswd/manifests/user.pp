define httpasswd::user($password, $file)
{
    Exec{
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    }

    package {"apache2-utils":   ensure => present } 

    file{$file:
        ensure => present,
    }

    exec {"create_user":
        command => "htpasswd -b $file ${name} ${password}",
        require => [Package['apache2-utils'], File[$file]],
    }
}
