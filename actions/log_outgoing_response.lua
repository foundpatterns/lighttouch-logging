event: ["outgoing_response_about_to_be_sent"]
priority: 1
input_parameters: []

local fields = table.copy(response)
fields.model = "outgoing-response"
fields.body = nil
fields.body_raw = nil

content.write_file("outgoing-response", response.uuid, fields, response.body_raw)
