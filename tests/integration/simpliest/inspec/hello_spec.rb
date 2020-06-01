
# better to start is in background and check it's running only
# better to avoid shell scripting check proc/port/output using inspec as shown below
describe command('bash -c "cd /srv/hello && ./tests/run_test.sh"') do
  its('exit_status') { should eq 0 }
end


#cmd = <<-EOH
  ## script something
  ## script something
  ## script something
#EOH

#describe command(cmd) do
  #its('exit_status') { should eq 0 }
#end

## check port
#describe port(5000) do
  #it { should be_listening }
#end

#describe command('curl -m 10 -s -v -f http://127.0.0.1:5000/') do
  #its('stdout') { should eq 'Hello World!' }
  #its('exit_status') { should eq 0 }
#end

## BUT BE AWARE OF NOT YET IMPLEMENTED F ON DOCKER ENV BELOW
#return if ::File.exist?('/.dockerenv')

## check that ssh runs
#if os.unix?
  #describe port(5000) do
    #it { should be_listening }
    #its('protocols') { should include('tcp') }
  #end
#end
## extra test for linux
#if os.linux?
  #describe port(5000) do
    #its('processes') { should include 'python' }
    #its('protocols') { should include 'tcp' }
    #its('addresses') {should include '0.0.0.0'}
  #end
#end
