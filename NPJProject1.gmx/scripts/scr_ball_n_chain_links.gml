///Ball and Chain Links
var chain_origin_x = enemy_parent.x;
var chain_origin_y = enemy_parent.y-16;
var chain_endpoint_x = (x-enemy_parent.x)
var chain_endpoint_y = (y-enemy_parent.y+16)

for (var index = 0; index < link_max; index += 1)
{
    link_array[index].x = (chain_origin_x) + ((chain_endpoint_x) * ((index+1)/5));
    link_array[index].y = (chain_origin_y) + ((chain_endpoint_y) * ((index+1)/5));        
}
