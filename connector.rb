{
  title: 'My Test Connector',

  connection: {
    fields: [],
    authorization: { type: 'none' },
    base_uri: lambda do |_connection|
      'https://jsonplaceholder.typicode.com'
    end
  },

  test: lambda do |_connection|
    get('/users/1')
  end,

  actions: {
    get_user: {
      title: 'Get user',
      description: 'Ambil data user berdasarkan ID',

      input_fields: lambda do
        [{ name: 'user_id', type: 'integer', optional: false }]
      end,

      execute: lambda do |_connection, input|
        get("/users/#{input['user_id']}")
      end,

      output_fields: lambda do
        [
          { name: 'id', type: 'integer' },
          { name: 'name' },
          { name: 'email' }
        ]
      end
    }
  }
}