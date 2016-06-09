control "cis-6-1-2" do
  impact 1.0
  title "6.1.2 Enable crond Daemon (Scored)"
  desc "The crond daemon is used to execute batch jobs on the system." 
  describe service('crond') do
    it { should be_enabled }
  end
end

control "cis-6-1-4" do
  impact 1.0
  title "6.1.4 Set User/Group Owner and Permission on /etc/crontab (Scored)"
  desc "The /etc/crontab file is used by cron to control its own jobs. The commands in this item make here sure that root is the user and group owner of the file and is the only user that can read and write the file." 
  describe file('/etc/crontab') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-5" do
  impact 1.0
  title "6.1.5 Set User/Group Owner and Permission on /etc/cron.hourly (Scored)"
  desc "This directory contains system cron jobs that need to run on an hourly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.hourly') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-6" do
  impact 1.0
  title "6.1.6 Set User/Group Owner and Permission on /etc/cron.daily (Scored)"
  desc "The /etc/cron.daily directory contains system cron jobs that need to run on a daily basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.daily') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-7" do
  impact 1.0
  title "6.1.7 Set User/Group Owner and Permission on /etc/cron.weekly (Scored)"
  desc "The /etc/cron.weekly directory contains system cron jobs that need to run on a weekly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.weekly') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-8" do
  impact 1.0
  title "6.1.8 Set User/Group Owner and Permission on /etc/cron.monthly (Scored)"
  desc "The /etc/cron.monthly directory contains system cron jobs that need to run on a monthly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.monthly') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "cis-6-1-9" do
  impact 1.0
  title "6.1.9 Set User/Group Owner and Permission on /etc/cron.d (Scored)"
  desc "TThe /etc/cron.d directory contains system cron jobs that need to run in a similar manner to the hourly, daily weekly and monthly jobs from /etc/crontab, but require more granular control as to when they run. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory." 
  describe file('/etc/cron.d') do
    it { should exist }
    its('mode') {should eq 0600}
  end
end

control "6-2-1" do
    impact 1
    title "6.2.1 Set SSH Protocol to 2 (Scored)"
    desc "SSH supports two different and incompatible protocols: SSH1 and SSH2. SSH1 was the original protocol and was subject to security issues. SSH2 is more advanced and secure."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match 'Protocol 2'}
    end
end

control "6-2-2" do
    impact 1
    title "6.2.2 Set LogLevel to INFO (Scored)"
    desc "The INFO parameter specifices that record login and logout activity will be logged."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match 'LogLevel INFO'}
    end
end

control "6-2-3" do
    impact 1
    title "6.2.3 Set Permissions on /etc/ssh/sshd_config (Scored)"
    desc "The /etc/ssh/sshd_config file contains configuration specifications for sshd. The command below sets the owner and group of the file to root."
    describe file('/etc/ssh/sshd_config') do
    it { should exist }
    its('mode') {should eq 0600}
    end
end

control "6-2-4" do
    impact 1
    title "6.2.4 Disable SSH X11 Forwarding (Scored)"
    desc "The X11Forwarding parameter provides the ability to tunnel X11 traffic through the connection to enable remote graphic connections."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^X11Forwarding no'}
    end
end

control "6-2-5" do
    impact 1
    title "6.2.5 Set SSH MaxAuthTries to 4 or Less (Scored)"
    desc "The MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection. When the login failure count reaches half the number, error messages will be written to the syslog file detailing the login failure."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^MaxAuthTries 4'}
    end
end

control "6-2-6" do
    impact 1
    title "6.2.6 Set SSH IgnoreRhosts to Yes (Scored)"
    desc "The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication orHostbasedAuthentication."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^IgnoreRhosts yes'}
    end
end

control "6-2-7" do
    impact 1
    title "6.2.7 Set SSH HostbasedAuthentication to No (Scored)"
    desc "The HostbasedAuthentication parameter specifies if authentication is allowed through trusted hosts via the user of .rhosts, or /etc/hosts.equiv, along with successful public key client host authentication. This option only applies to SSH Protocol Version 2."
    describe file('/etc/ssh/sshd_config') do
      its ('content')  {should match '^HostbasedAuthentication no'}
    end
end