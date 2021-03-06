define mcollective::connector (
  $type = 'activemq',
  $pool = [
    {
      host     => 'localhost',
      password => 'mcollective',
      port     => '61614',
      ssl      => {},
      user     => 'mcollective',
    }
  ],
) {

  concat::fragment { "${name} - ${type} connector":
    content => template("mcollective/connector/${type}.cfg.erb"),
    order   => 20,
    target  => $name,
  }

}
