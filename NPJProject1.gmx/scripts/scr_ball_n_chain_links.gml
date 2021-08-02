///Ball and Chain Links
var chain_origin_x = enemy_parent.x + origin_offset_x;
var chain_origin_y = enemy_parent.y + origin_offset_y;
if (moving_origin == true)
{
    chain_origin_x += offset_x_array[enemy_parent.image_index];
    chain_origin_y += offset_y_array[enemy_parent.image_index];
}
var chain_endpoint_x = ((x+chain_offset_x)-chain_origin_x);
var chain_endpoint_y = ((y+chain_offset_y)-chain_origin_y);

for (var index = 0; index < link_max; index += 1)
{
    link_array[index].x = (chain_origin_x) + ((chain_endpoint_x) * ((index+1)/(link_max+1)));
    link_array[index].y = (chain_origin_y) + ((chain_endpoint_y) * ((index+1)/(link_max+1)));        
    
    //Bend
    if (bend == true)
    {
        midpoint_y = chain_endpoint_y/2;
        link_array[index].x += sqrt(sqr(midpoint_y)-sqr(midpoint_y-(link_array[index].y-chain_origin_y)));
    }
    
    //Double Bend
    if (double_bend == true)
    {
        midpoint_x = chain_endpoint_x/2;
        midpoint_y = chain_endpoint_y/2;
        var bend_length_square_x = sqr(midpoint_x)-sqr(midpoint_x-(link_array[index].x-chain_origin_x));
        var bend_direction_x = sign(bend_length_square_x); 
        link_array[index].x -= sqrt(sqr(midpoint_y)-sqr(midpoint_y-(link_array[index].y-chain_origin_y)));
        link_array[index].y -= bend_direction_x*sqrt(abs(bend_length_square_x));
    }
}
