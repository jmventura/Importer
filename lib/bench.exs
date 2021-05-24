

  Benchee.run(%{
    json: fn -> Importer.parse("converted.txt", :json) end,
    native: fn -> Importer.parse("converted.txt", :native) end
  })
