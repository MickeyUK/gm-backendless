/// url_encode(string)
var str=argument0,url="",hex,special,
i,jj,length,char,o,esc,esc_bytes;

hex = "0123456789ABCDEF";
special = "$&+,/:;=?@ " + '"' + "'<>#%{}|\^~[]`!";

length = string_length(str);

for (i=1;i<=length;i++) {

    char = string_char_at(str, i);
    o = ord(char);
    esc = 0;
    
    if (o <= $7F) {
    
        if (string_pos(char, special) != 0) || (o < 32) {
        
            esc = 1;
            esc_bytes[0] = o;
            
        }
        
    } else 
    
    if (o <= $7FF) {
    
        esc = 2;
        esc_bytes[0] = (o>>6)+192;
        esc_bytes[1] = (o&63)+128;
        
    } else
    
    if (o <= $FFFF) { 
    
        esc = 3;
        esc_bytes[0] = (o>>12)+224;
        esc_bytes[1] = ((o>>6)&63)+128;
        esc_bytes[2] = (o&63)+128;
        
    } else {
    
        show_error("Invalid character", true);
        
    }
    
    if (esc == 0) {
    
        url += char;
        
    } else {
    
        for (ii=0; ii<esc; ii++) {
            url += "%" + string_char_at(hex, (esc_bytes[ii]>>4)+1) + string_char_at(hex, (esc_bytes[ii]&15)+1);
        }
            
    }

}

return url;
