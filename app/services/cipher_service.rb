# frozen_string_literal: true

require 'openssl'
require 'base64'

class CipherService
  PASSWORD = Base64.strict_decode64('EPN1ySFcB5UwzLgBrf58D8YXOGwUsvVmM7/hWTXQqUQ=')
  CIPHER_METHOD = 'AES-256-CBC'

  class << self

    def encrypt(str)
      cipher = OpenSSL::Cipher.new(CIPHER_METHOD)
      cipher.encrypt
      cipher.key = PASSWORD
      iv = cipher.random_iv
      cipher.iv = iv
      encrypted = Base64.strict_encode64(cipher.update(str) + cipher.final)
      iv = Base64.strict_encode64(iv)
      mac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), PASSWORD, iv + encrypted)

      hash = { iv: iv, value: encrypted, mac: mac }
      Base64.strict_encode64(hash.to_json)
    end

    def decrypt(str)
      data = Base64.decode64(str)
      json = JSON.parse(data)
      cipher = OpenSSL::Cipher.new(CIPHER_METHOD)
      cipher.decrypt
      cipher.key = PASSWORD
      cipher.iv = Base64.strict_decode64(json['iv'])
      data_body = Base64.strict_decode64(json['value'])
      cipher.update(data_body) + cipher.final
    end

  end
end
