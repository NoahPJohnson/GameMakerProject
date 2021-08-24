if (place_meeting(x,y+1,obj_boundary))
{
    if (!place_meeting(x,y-1,obj_boundary))
    {
        if (!place_meeting(x-1,y,obj_boundary))
        {
            image_index = 6;
        }
        else if (!place_meeting(x+1,y,obj_boundary))
        {
            image_index = 8;
        }
        else if (place_meeting(x-1,y,obj_boundary) && place_meeting(x+1,y,obj_boundary))
        {
            image_index = 7;
        }
    }
    else
    {
        if (!place_meeting(x-1,y,obj_boundary))
        {
            image_index = 3;
        }
        else if (!place_meeting(x+1,y,obj_boundary))
        {
            image_index = 5;
        }
        else
        {
            image_index = 4;
        }
    }
}
else if (place_meeting(x,y-1,obj_boundary))
{
    if (!place_meeting(x,y+1,obj_boundary))
    {
        if (!place_meeting(x-1,y,obj_boundary))
        {
            image_index = 0;
        }
        else if (!place_meeting(x+1,y,obj_boundary))
        {
            image_index = 2;
        }
        else 
        {
            image_index = 1;
        }
    }
}
else
{
    if (!place_meeting(x-1,y,obj_boundary))
    {
        image_index = 6;
    }
    else if (!place_meeting(x+1,y,obj_boundary))
    {
        image_index = 8;
    }
    else
    {
        image_index = 7;
    }
}

