define htpasswd::user($password, $file, $ensure = present, $encryption = 'md5')
{
    Exec{
        path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    }

    package {"apache2-utils":   ensure => present } 

    file{$file:
        ensure => present,
    }
    
    case $encryption {
        'md5':      {   $enctype = "-m" }
        'sha':      {   $enctype = "-s" }
        'crypt':    {   $enctype = "-d" }
        'plain':    {   $enctype = "-p" }
        default:    {   $enctype = "-m" } 
    }    

    case $ensure {
        absent:     {   $cmd = "htpasswd -b -D $file ${name}" }
        present:    {   $cmd = "htpasswd -b ${enctype} $file ${name} ${password}" }
        default:    {   $cmd = "htpasswd -b ${enctype} $file ${name} ${password}" }
    }

    exec {"manage_user":
        command => "${cmd}",
        require => [Package['apache2-utils'], File[$file]],
    }
}
