event: ["outgoing_request_about_to_be_sent"]
priority: 1
input_parameters: ["request"]

local log_text = yaml.from_table(request)
fs.create_dir("log/outgoing-request", true)
local log_file = io.open("log/outgoing-request/" .. request.uuid, "w")

log_file:write(log_text)
log_file:close()
