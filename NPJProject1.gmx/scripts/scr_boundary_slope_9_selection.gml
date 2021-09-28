if (!place_meeting(x,y+1,obj_boundary) && place_meeting(x-1,y,obj_boundary))
{
    slope_image_index = 1;
}
else if (place_meeting(x,y+1,obj_boundary) && !place_meeting(x-1,y,obj_boundary))
{
    slope_image_index = 2;   
}
else 
{
    slope_image_index = 0;
}


