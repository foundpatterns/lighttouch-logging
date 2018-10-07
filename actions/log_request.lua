event: ["logRequest"]
priority: 1
print("logging request")
local debug = require "debug"

local uuid_saved = debug.uuid_return()    

local log_text = debug.print_req_info_return(req)
os.execute("mkdir -p logs/requests")
local log_file = io.open("logs/requests/" .. uuid_saved, "w")


log_file:write(log_text)
log_file:close()                                
