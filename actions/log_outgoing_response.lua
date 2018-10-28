event: ["outgoing_response_about_to_be_sent"]
priority: 1

if not response then
  log.error("outgoing_response_about_to_be_sent trigerred but no response available")
  return
end

local uuid_saved = uuid.v4()
local log_text = yaml.from_table(response)
fs.create_dir("log/outgoing-response", true)
local log_file = io.open("log/outgoing-response/" .. uuid_saved, "w")

log_file:write(log_text)
log_file:close()
