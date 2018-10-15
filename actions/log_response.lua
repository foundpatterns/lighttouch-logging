event: ["response_process"]
priority: 1

local debug = require "debug"


local uuid_saved = debug.uuid_return()

if not response then
  log.error("response_process trigerred but no response available")
  return
end

local log_text = debug.print_res_info_return(response)
os.execute("mkdir -p log/response")
local log_file = io.open("log/response/" .. uuid_saved, "w")

log_file:write(log_text)
log_file:close()                                
