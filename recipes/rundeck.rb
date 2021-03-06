script 'extract_module' do
  interpreter "bash"
  code <<-EOH
  export JAVA_HOME='/usr'
  URL='http://dl.bintray.com/rundeck/rundeck-deb/rundeck-2.6.7-1-GA.deb'; FILE=`mktemp`; sudo wget "$URL" -qO $FILE && sudo dpkg -i $FILE; rm $FILE
    EOH
end
file '/etc/rundeck/rundeck-config.properties' do
  content '
  loglevel.default=INFO
  rdeck.base=/var/lib/rundeck
  rss.enabled=false
  dataSource.dbCreate = update
  dataSource.url = jdbc:h2:file:/var/lib/rundeck/data/rundeckdb;MVCC=true;TRACE_LEVEL_FILE=4'
  owner 'rundeck'
  group 'rundeck'
  mode '0640'
  action :create
end
