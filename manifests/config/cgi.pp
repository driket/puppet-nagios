define mv_nagios::config::cgi (
	$use_authentication 											= '1',
	$use_ssl_authentication										= '0',
	$authorized_for_system_information				= 'admin',
	$authorized_for_configuration_information = 'admin',
	$authorized_for_system_commands						= 'admin',
	$authorized_for_all_services							= 'admin',
	$authorized_for_all_hosts									= 'admin',
	$authorized_for_all_service_commands			= 'admin',
	$authorized_for_all_host_commands					= 'admin',
) 
{
	require('mv_nagios::packages')
	require('mv_nagios')

    file { "cgi-conf": 
			path 		=> "${mv_nagios::config_path}/cgi.cfg",
      ensure 	=> file,
      content => template("mv_nagios/cgi.cfg.erb"),
      mode 		=> "0644",
      owner 	=> 'root',
      group 	=> 'root',
			require => Package["nagios3","sendemail","netcat"],
      notify 	=> Service["mv_nagios"],
    }
}

