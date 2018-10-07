event: ["logRequest"]
priority: 1

local debug = require "debug"

local uuid_saved = debug.uuid_return()    

local log_text = debug.print_req_info_return(req)
os.execute("mkdir -p log/request")
local log_file = io.open("log/request/" .. uuid_saved, "w")


log_file:write(log_text)
log_file:close()                                
