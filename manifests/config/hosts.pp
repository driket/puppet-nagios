
define mv_nagios::config::hosts ($hosts = [{ hostname => "localhost", fqdn => "localhost",}]) {
	require('mv_nagios::packages')
	require('mv_nagios')

    file {"hosts-lic": 
		path => "${mv_nagios::config_path}/conf.d/host-lic.cfg",
        ensure => file,
        content => template("mv_nagios/host-lic.cfg.erb"),
        mode => "0644",
        owner => 'root',
        group => 'root',
		require => Package["nagios3","sendemail","netcat"],
        notify => Service["mv_nagios"],
    }
}