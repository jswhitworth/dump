file '/tmp/motd' do
  content 'hello worl'
end
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end
package 'openjdk-7-jdk'
