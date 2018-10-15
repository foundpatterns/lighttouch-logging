event: ["incoming_request_received"]
priority: 1

local debug = require "debug"

local uuid_saved = debug.uuid_return()    

local log_text = debug.print_request_info_return(request)
os.execute("mkdir -p log/incoming-request")
local log_file = io.open("log/incoming-request/" .. uuid_saved, "w")


log_file:write(log_text)
log_file:close()                                
