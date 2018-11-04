event: ["incoming_request_received"]
priority: 1
input_parameters: []


local uuid_saved = uuid.v4()

local log_text = yaml.from_table(request)
fs.create_dir("log/incoming-request", true)
local log_file = io.open("log/incoming-request/" .. uuid_saved, "w")

log_file:write(log_text)
log_file:close()

log.info("Logged incoming request as " .. uuid_saved)
