define mv_nagios::config::commands (
	$mail_server 		= 'courrier', 
	$mail_login 		= '', 
	$mail_password 	= ''
) 
{
	require('mv_nagios::packages')
	require('mv_nagios')

	file {"${mv_nagios::config_path}/commands.cfg": 
  	ensure 	=> file,
    content => template("mv_nagios/commands.cfg.erb"),
    mode 		=> "0644",
    owner 	=> 'root',
    group 	=> 'root',
		require => Package["nagios3","sendemail","netcat"],
    notify 	=> Service["mv_nagios"],
  }
}