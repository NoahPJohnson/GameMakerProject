if (long == true)
{
    if (place_meeting(x,y+1,obj_boundary))
    {
        image_index = 1;
    }
    else if (place_meeting(x,y-1,obj_boundary))
    {
        image_index = 2;
    }
    else 
    {
        image_index = 0;
    }
}
else 
{
    if (place_meeting(x+1,y,obj_boundary))
    {
        image_index = 1;
    }
    else if (place_meeting(x-1,y,obj_boundary))
    {
        image_index = 2;
    }
    else
    {
        image_index = 0;
    }
}



