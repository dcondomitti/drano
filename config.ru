require 'bundler/setup'
Bundler.require(:default)

OFFICE_IP = ENV['OFFICE_IP']
OFFICE_CACHE = ENV['OFFICE_CACHE'] 

app = proc do |env|
  client_ip = env['HTTP_X_REAL_IP'] ||= env['REMOTE_ADDR']
  target_url = env['REQUEST_PATH'].gsub(/\A\//, '')
  target_url = OFFICE_CACHE + requested_url if OFFICE_IP == client_ip
  
  [301, { location: target_url}, '']
end

run app
