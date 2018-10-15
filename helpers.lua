
local debug = require "debug"

local helpers = {}

function helpers.send_request (request)
  local uuid_saved = uuid.v4()

  local log_text
  if type(request) == "string" then
    log_text = "GET " .. request .. "\nHeaders:\nBody:\n"
  else
    log_text = (request.method or "GET") .. " " .. request.uri .. "\nHeaders:\n"
    if request.headers then
      for k, v in pairs(request.headers) do
        log_text = log_text .. "\t" .. k .. ": " .. v .. "\n"
      end
    end
    log_text = log_text .. "Body:\n" .. (request.body or "")
  end

  os.execute("mkdir -p log/outgoing-request")
  local log_file = io.open("log/outgoing-request/" .. uuid_saved, "w")
  log_file:write(log_text)
  log_file:close()

  local response = client_request.send(request)

  
  local log_text = response.status .. " " .. (request.uri or request) .. "\nHeaders:\n"
  if response.headers then
    for k, v in pairs(response.headers) do
      log_text = log_text .. "\t" .. k .. ": " .. v .. "\n"
    end
  end
  log_text = log_text .. "Body:\n" .. response.body_raw

  os.execute("mkdir -p log/incoming-response")
  local log_file = io.open("log/incoming-response/" .. uuid_saved, "w")
  log_file:write(log_text)
  log_file:close()

  return response
end

return helpers