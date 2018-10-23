event: ["incoming_request_received"]
priority: 1

local uuid_saved = uuid.v4()

local log_text = yaml.dump(request)
os.execute("mkdir -p log/incoming-request")
local log_file = io.open("log/incoming-request/" .. uuid_saved, "w")

log_file:write(log_text)
log_file:close()
