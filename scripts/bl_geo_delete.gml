/// bl_geo_delete(objectId)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;

// Request
bl_action = 13; // For networking event
bl_request = http_request(bl_geo+"points/"+argument[0],"DELETE",headers,json);

// Clearup
ds_map_destroy(headers);
