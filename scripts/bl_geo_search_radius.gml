/// bl_geo_search_radius(latitude,longitude,radius,categories,limit,offset,where,meta)

// Headers
var headers = ds_map_create();
    headers[? "Content-Type"] = "application/json";

// User token
if (bl_token != "") then headers[? "user-token"] = bl_token;

// Query
query = bl_geo + "points?";
query += "latitude="+argument[0];
query += "&longitude="+argument[1];
query += "&radius="+argument[2];

var cat = "Default";
if (argument[3] != "") then cat = argument[3]; 
query += "&categories="+cat;

query += "&pageSize="+argument[4];
query += "&offset="+argument[5];
if (argument_count > 6) then query += "&where="+url_encode(argument[6]);
if (argument_count > 7) then query += "&metadata="+url_encode(argument[7]);

// Request
bl_action = 15; // For networking event
bl_request = http_request(query,"GET",headers,"");

// Clearup
ds_map_destroy(headers);
