/// bl_geo_search_cat(categories,limit,offset,where,meta)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;

// Query
query = bl_geo + "points?categories="+argument[0];
query += "&pageSize="+argument[1];
query += "&offset="+argument[2];
if (argument_count > 3) then query += "&where="+url_encode(argument[3]);
if (argument_count > 4) then query += "&metadata="+url_encode(argument[4]);

// Request
bl_action = 14; // For networking event
bl_request = http_request(query,"GET",headers,"");

// Clearup
ds_map_destroy(headers);
