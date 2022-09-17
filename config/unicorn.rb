working_directory "/app"

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
  timeout 15
  preload_app true

#   listen '/home/CocoaFlavorMap/shared/sockets/unicorn-map.sock'
#   pid    '/home/CocoaFlavorMap/shared/pids/unicorn-map.pid'
  
  listen '/unicorn/pids/unicorn-map.sock'
  pid    '/unicorn/pids/unicorn-map.pid'

  before_fork do |server, worker|
    Signal.trap 'TERM' do
      puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
      Process.kill 'QUIT', Process.pid
    end

    defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
  end

  after_fork do |server, worker|
    Signal.trap 'TERM' do
      puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
    end

    defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
  end

  stderr_path File.expand_path('log/unicorn.stderr.log', ENV['RAILS_ROOT'])
  stdout_path File.expand_path('log/unicorn.stdout.log', ENV['RAILS_ROOT'])