event: ["outgoing_response_about_to_be_sent"]
priority: 1

local debug = require "debug"


local uuid_saved = debug.uuid_return()

if not response then
  log.error("outgoing_response_about_to_be_sent trigerred but no response available")
  return
end

local log_text = debug.print_res_info_return(response)
os.execute("mkdir -p log/outgoing-response")
local log_file = io.open("log/outgoing-response/" .. uuid_saved, "w")

log_file:write(log_text)
log_file:close()                                
