

%w(curl git).each do |p|
  package p
end

git '/srv/hello' do
  repository 'https://github.com/tcpcloud/python-flask-hello'
  action :sync
end

python_runtime '2'
python_virtualenv '/srv/hello/.env'

python_package 'flask' do
  virtualenv '/srv/hello/.env'
  #version '1.8'
end

pip_requirements '/srv/hello/requirements.txt' if ::File.exist?('srv/hello/requirements.txt')




