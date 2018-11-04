event: ["request_log"]
priority: 1
input_parameters: ["request"]

local log_uuid = request.path_segments[1]

local log_content = content.read_log(log_uuid)

return {
  headers = { ["content-type"] = "application/json" },
  body = json.from_table(log_content)
}