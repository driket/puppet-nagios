define mv_nagios::config::services ($services = ["localhost"]) {
	require('mv_nagios::packages')
	require('mv_nagios')

    file {"services-lic": 
		path => "${mv_nagios::config_path}/conf.d/services-lic.cfg",
        ensure => file,
        content => template("mv_nagios/services-lic.cfg.erb"),
        mode => "0644",
        owner => 'root',
        group => 'root',
		require => Package["mv_nagios"],
        notify => Service["mv_nagios"],
    }
}