/// bl_geo_add(longitude,latitude,categories_list,meta_map)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;

// Position
var body = ds_map_create();
    body[? "latitude"] = argument[0];
    body[? "longitude"] = argument[1];

// Categories
if (argument_count > 2) then ds_map_add_list(body,"categories",argument[2]);

// Meta
if (argument_count > 3) then ds_map_add_map(body,"metadata",argument[3]);
    
// Convert to JSON
var json = json_encode(body);

// Request
bl_action = 11; // For networking event
bl_request = http_request(bl_geo+"points","POST",headers,json);

// Clearup
ds_map_destroy(headers);
ds_map_destroy(body);
