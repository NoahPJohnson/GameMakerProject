if (long == true)
{
    if ((place_meeting(x,y+1,obj_boundary) || tile_layer_find(8,x,y+(32)+1) != -1) && !place_meeting(x,y+1,obj_boundary_moving) && !place_meeting(x,y+1,obj_enemy_spawner_barrier))
    {
        image_index = 1;
    }
    else if ((place_meeting(x,y-1,obj_boundary) || tile_layer_find(8,x,y-1) != -1) && !place_meeting(x,y-1,obj_boundary_moving) && !place_meeting(x,y-1,obj_enemy_spawner_barrier))
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
    if ((place_meeting(x+1,y,obj_boundary) || tile_layer_find(8,x+(32)+1,y) != -1) && !place_meeting(x+1,y,obj_boundary_moving) && !place_meeting(x+1,y,obj_enemy_spawner_barrier))
    {
        image_index = 1;
    }
    else if ((place_meeting(x-1,y,obj_boundary) || tile_layer_find(8,x-1,y) != -1) && !place_meeting(x-1,y,obj_boundary_moving) && !place_meeting(x-1,y,obj_enemy_spawner_barrier))
    {
        image_index = 2;
    }
    else
    {
        image_index = 0;
    }
}



