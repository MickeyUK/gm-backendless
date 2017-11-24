/// bl_data_update(table,objectId,body_map,where)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;
    
// Convert to JSON
var json = json_encode(argument[1]);

// Query
var query = bl_data+"/"+argument[0]+"/"+argument[1];

// Where clause
if (argument_count > 3) {
    query += "?where="+url_encode(argument[3]);
}

// Request
bl_action = 6; // For networking event
bl_request = http_request(query,"PUT",headers,json);

// Clearup
ds_map_destroy(headers);
ds_map_destroy(argument[2]);
