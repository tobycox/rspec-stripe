#!/user/bin/env ruby

require 'webrick'
require 'webrick/https'
require 'openssl'


pkey = cert = cert_name = nil
begin
  pkey =
OpenSSL::PKey::RSA.new(File.open("/etc/apache2/ssl/host.key").read)
  cert =
OpenSSL::X509::Certificate.new(File.open("/etc/apache2/ssl/host.key").read)
rescue
  $stderr.puts "Switching to use self-signed certificate"
  cert_name = [ ["C","JP"], ["O","WEBrick.Org"], ["CN", "WWW"] ]
end

s = WEBrick::HTTPServer.new(
  :Port             => 2000, 
  :DocumentRoot     => ".",
  :SSLEnable        => true,
  :SSLVerifyClient  => OpenSSL::SSL::VERIFY_NONE,
  :SSLCertificate   => cert,
  :SSLPrivateKey    => pkey,
  :SSLCertName      => cert_name
)
trap('INT') { s.stop }
s.start
