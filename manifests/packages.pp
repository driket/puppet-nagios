class mv_nagios::packages {
	require('mv_nagios::params')

	package {["nagios3","sendemail","netcat"]:
		ensure => present,
	}
	package {"wget":
		ensure => present,
 	}

}
