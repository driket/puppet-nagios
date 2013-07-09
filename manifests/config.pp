class mv_nagios::config {
	require('mv_nagios::packages')
	
    file {"index.html": 
		path => "${mv_nagios::apache_www_directory}/index.html",
        ensure => file,
      	source => "puppet:///modules/mv_nagios/index.html",
        mode => "0644",
        owner => 'root',
        group => 'root',
    }
	
    file {"${mv_nagios::params::config_path}/conf.d/generic-service_nagios2.cfg": 
        ensure => file,
        content => template("mv_nagios/generic-service_nagios2.cfg.erb"),
        mode => "0644",
        owner => 'root',
        group => 'root',
		require => Package["mv_nagios"],
        notify => Service["mv_nagios"],
    }
    file {"${mv_nagios::params::config_path}/conf.d/generic-host_nagios2.cfg": 
        ensure => file,
        content => template("mv_nagios/generic-host_nagios2.cfg.erb"),
        mode => "0644",
        owner => 'root',
        group => 'root',
		require => Package["mv_nagios"],
        notify => Service["mv_nagios"],
    }
    file {"${mv_nagios::params::config_path}/conf.d/timeperiods_nagios2.cfg": 
        ensure => file,
        content => template("mv_nagios/timeperiods.cfg.erb"),
        mode => "0644",
        owner => 'root',
        group => 'root',
		require => Package["mv_nagios"],
        notify => Service["mv_nagios"],
    }
	file {"${mv_nagios::params::config_path}/conf.d/localhost_nagios2.cfg":
		ensure => absent,
		require => Package["mv_nagios"],
        notify => Service["mv_nagios"],
	}

	# give proper right to dhcp check (sticky bit)
    file {"/usr/lib/nagios/plugins/check_dhcp": 
        ensure => file,
        mode => "4755",
        owner => 'root',
        group => 'nagios',
		require => Package["mv_nagios"],
    }	
		
	#extra plugins
    file {"/usr/lib/nagios/plugins/check_memory.sh": 
        ensure => file,
      	source => "puppet:///modules/mv_nagios/check_memory.sh",
        mode => "0755",
        owner => 'root',
        group => 'root',
    }
    file {"/usr/lib/nagios/plugins/check_dhcp.sh": 
        ensure => file,
      	source => "puppet:///modules/mv_nagios/check_dhcp.sh",
        mode => "4755",
        owner => 'root',
        group => 'nagios',
    }
	#todo : add sudoer modif -> sudo in script
	
    file {"/usr/lib/nagios/plugins/check_website_response.sh": 
        ensure => file,
      	source => "puppet:///modules/mv_nagios/check_website_response.sh",
        mode => "0755",
        owner => 'root',
        group => 'root',
    }
}
