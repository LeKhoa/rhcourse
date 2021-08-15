class CreateConvertLabsAccount


  def self.call
    user_data = {
      name: 'John Doe',
      email: 'test@example.com',
      phone: '124',
      password: '12345678'
    }

    data = ConverLabsCrypt.encrypt(user_data.to_json),

    options = {
      body: {
        data: data,
        theme: '1'
      }
    }

    HTTParty.post('https://convertlabs.io/api/ota/user_bundle_setup', options)
  end
end
