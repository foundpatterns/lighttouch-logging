event: ["incoming_request_received"]
priority: 1
input_parameters: ["request"]

local log_text = yaml.from_table(request)
fs.create_dir("log/incoming-request", true)
local log_file = io.open("log/incoming-request/" .. request.uuid, "w")

log_file:write(log_text)
log_file:close()
