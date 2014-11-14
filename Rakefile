require 'rake'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'
task :provision => 'provision:default'
task :default => [ :provision, :spec]
task :ansible => 'provision:ansible'

namespace :provision do
  task :default => [ :vagrant, :ansible ]
  task :vagrant do
    sh 'vagrant up'
    sh 'sleep 5' # give things a chance to settle
  end
  task :ansible do 
    sh 'ansible-playbook -i inventory/ test.yml'
  end
  task :cleanup do
    sh 'vagrant destroy -f'
  end
end

namespace :spec do
  shared_tests = ['all_servers']
  running_vagrant_hosts = 
    `vagrant status | grep running | awk '{print $1}'`.lines.map(&:strip)
  hosts, spectasks = [], []
  
  running_vagrant_hosts.each do |host|
    spec_dirs = shared_tests.dup
    spec_dirs << host if File.directory? "spec/#{host}"
    spec_dirs.each do |dir|
      desc "Run serverspec tests in #{dir} on #{host}"
      taskname = "#{host}_#{dir}"
      spectasks <<  taskname
      RSpec::Core::RakeTask.new(taskname.to_sym) do |t|
        ENV['TARGET_HOST'] = host 
        t.pattern = "spec/#{dir}/*_spec.rb"
      end
    end
  end

  task :all     => spectasks
  task :default => :all 

end
