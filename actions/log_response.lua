event: ["resProcess"]
priority: 1

local debug = require "debug"


local uuid_saved = debug.uuid_return()

local res = torchbear_response
if not res then
  log.warn("no torchbear_response")
  return
end

local log_text = debug.print_res_info_return(res)
os.execute("mkdir -p log/response")
local log_file = io.open("log/response/" .. uuid_saved, "w")

log_file:write(log_text)
log_file:close()                                
