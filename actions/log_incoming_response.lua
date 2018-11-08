event: ["incoming_response_received"]
priority: 1
input_parameters: ["response"]

local log_text = yaml.from_table(response)
fs.create_dir("log/incoming-response", true)
local log_file = io.open("log/incoming-response/" .. request.uuid, "w")

log_file:write(log_text)
log_file:close()
