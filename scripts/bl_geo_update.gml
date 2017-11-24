/// bl_geo_update(objectId,longitude,latitude,categories_list,meta_map)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;

// Position
var body = ds_map_create();
    body[? "latitude"] = argument[1];
    body[? "longitude"] = argument[2];

// Categories
if (argument_count > 3) then ds_map_add_list(body,"categories",argument[3]);

// Meta
if (argument_count > 4) then ds_map_add_map(body,"metadata",argument[4]);
    
// Convert to JSON
var json = json_encode(body);

// Request
bl_action = 12; // For networking event
bl_request = http_request(bl_geo+"points/"+argument[0],"PUT",headers,json);

// Clearup
ds_map_destroy(headers);
ds_map_destroy(body);
