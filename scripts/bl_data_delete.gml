/// bl_data_delete(table,objectId)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;

// Request
bl_action = 7; // For networking event
bl_request = http_request(bl_data+"/"+argument[0]+"/"+argument[1],"DELETE",headers,json);

// Clearup
ds_map_destroy(headers);
