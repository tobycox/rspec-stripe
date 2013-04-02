#!/user/bin/env ruby

require 'webrick'
require 'webrick/https'
require 'openssl'

cert_name = [
  %w[CN localhost],
]

s = WEBrick::HTTPServer.new(
  :Port             => 2000, 
  :DocumentRoot     => ".",
  :SSLEnable        => true,
  :SSLVerifyClient  => OpenSSL::SSL::VERIFY_NONE,
  :SSLCertName      => cert_name
)
trap('INT') { s.stop }
s.start
