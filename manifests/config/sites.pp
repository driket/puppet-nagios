define mv_nagios::config::sites ($sites = ["localhost"]) {
	require('mv_nagios::packages')
	require('mv_nagios')

    file {"sites-lic": 
		path => "${mv_nagios::config_path}/conf.d/sites-lic.cfg",
        ensure => file,
        content => template("mv_nagios/sites-lic.cfg.erb"),
        mode => "0644",
        owner => 'root',
        group => 'root',
		require => Package["nagios3","sendemail","netcat"],
        notify => Service["mv_nagios"],
    }
}