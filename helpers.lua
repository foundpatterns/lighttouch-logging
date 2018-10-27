
local helpers = {}

function helpers.send_request (request)
  local uuid_saved = uuid.v4()

  local log_text
  if type(request) == "string" then
    log_text = yaml.from_table({uri = request})
  else
    log_text = yaml.from_table(request)
  end

  os.execute("mkdir -p log/outgoing-request")
  local log_file = io.open("log/outgoing-request/" .. uuid_saved, "w")
  log_file:write(log_text)
  log_file:close()

  local response = client_request.send(request)

  
  local log_text = yaml.from_table(response)

  os.execute("mkdir -p log/incoming-response")
  local log_file = io.open("log/incoming-response/" .. uuid_saved, "w")
  log_file:write(log_text)
  log_file:close()

  return response
end

return helpers