file '/tmp/motd' do
  content 'hello worl'
end
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end
package 'openjdk-7-jdk'

script 'extract_module' do
  interpreter "bash"
  code <<-EOH
  URL='http://dl.bintray.com/rundeck/rundeck-deb/rundeck-2.6.7-1-GA.deb'; FILE=`mktemp`; sudo wget "$URL" -qO $FILE && sudo dpkg -i $FILE; rm $FILE
    EOH
end
