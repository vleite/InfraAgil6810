$instalar = ['vim','figlet']

package{ $instalar:
        ensure => present,
}

package{'htop':
        ensure => present,
}

exec{'Comando_MemFree':
        command => "/usr/bin/free -h > /tmp/memfree"
        #user => "vagrant"
}

file{'Memoria':
        name => '/opt/memfree',
        source => "/tmp/memfree",
        mode => '624',
        owner => 'vagrant',
        group => 'vagrant',
        ensure => 'present',
}

service{'cron':
        enable => false,
        ensure => stopped,
}
