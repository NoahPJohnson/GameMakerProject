if ((place_meeting(x,y+1,obj_boundary) || tile_layer_find(8,x,y+(32)+1) != -1) && !place_meeting(x,y+1,obj_boundary_moving) && !place_meeting(x,y+1,obj_enemy_spawner_barrier))
{
    if ((!place_meeting(x,y-1,obj_boundary) && tile_layer_find(8,x,y-1) == -1) || place_meeting(x,y-1,obj_boundary_moving) || place_meeting(x,y-1,obj_enemy_spawner_barrier))
    {
        if ((!place_meeting(x-1,y,obj_boundary) && tile_layer_find(8,x-1,y) == -1) || place_meeting(x-1,y,obj_boundary_moving) || place_meeting(x-1,y,obj_enemy_spawner_barrier))
        {
            image_index = 6;
        }
        else if ((!place_meeting(x+1,y,obj_boundary) && tile_layer_find(8,x+(32)+1,y) == -1) || place_meeting(x+1,y,obj_boundary_moving) || place_meeting(x+1,y,obj_enemy_spawner_barrier))
        {
            image_index = 8;
        }
        else if (((place_meeting(x-1,y,obj_boundary) || tile_layer_find(8,x-1,y) != -1) && !place_meeting(x-1,y,obj_boundary_moving) && !place_meeting(x-1,y,obj_enemy_spawner_barrier))
             && ((place_meeting(x+1,y,obj_boundary) || tile_layer_find(8,x+(32)+1,y) != -1) && !place_meeting(x+1,y,obj_boundary_moving) && !place_meeting(x+1,y,obj_enemy_spawner_barrier)))
        {
            image_index = 7;
        }
    }
    else if ((place_meeting(x,y-1,obj_boundary) || tile_layer_find(8,x,y-1) != -1) && !place_meeting(x,y-1,obj_boundary_moving) && !place_meeting(x,y-1,obj_enemy_spawner_barrier))
    {
        if ((!place_meeting(x-1,y,obj_boundary) && tile_layer_find(8,x-1,y) == -1) || place_meeting(x-1,y,obj_boundary_moving) || place_meeting(x-1,y,obj_enemy_spawner_barrier))
        {
            image_index = 3;
        }
        else if ((!place_meeting(x+1,y,obj_boundary) && tile_layer_find(8,x+(32)+1,y) == -1) || place_meeting(x+1,y,obj_boundary_moving) || place_meeting(x+1,y,obj_enemy_spawner_barrier))
        {
            image_index = 5;
        }
        else if (((place_meeting(x-1,y,obj_boundary) || tile_layer_find(8,x-1,y) != -1) && !place_meeting(x-1,y,obj_boundary_moving) && !place_meeting(x-1,y,obj_enemy_spawner_barrier))
             && ((place_meeting(x+1,y,obj_boundary) || tile_layer_find(8,x+(32)+1,y) != -1) && !place_meeting(x+1,y,obj_boundary_moving) && !place_meeting(x+1,y,obj_enemy_spawner_barrier)))
        {
            image_index = 4;
        }
    }
}
else if ((place_meeting(x,y-1,obj_boundary) || tile_layer_find(8,x,y-1) != -1) && !place_meeting(x,y-1,obj_boundary_moving) && !place_meeting(x,y-1,obj_enemy_spawner_barrier))
{
    if ((!place_meeting(x,y+1,obj_boundary) && tile_layer_find(8,x,y+(32)+1) == -1) || place_meeting(x,y+1,obj_boundary_moving) || place_meeting(x,y+1,obj_enemy_spawner_barrier))
    {
        if ((!place_meeting(x-1,y,obj_boundary) && tile_layer_find(8,x-1,y) == -1) || place_meeting(x-1,y,obj_boundary_moving) || place_meeting(x-1,y,obj_enemy_spawner_barrier))
        {
            image_index = 0;
        }
        else if ((!place_meeting(x+1,y,obj_boundary) && tile_layer_find(8,x+(32)+1,y) == -1) || place_meeting(x+1,y,obj_boundary_moving) || place_meeting(x+1,y,obj_enemy_spawner_barrier))
        {
            image_index = 2;
        }
        else if (((place_meeting(x-1,y,obj_boundary) || tile_layer_find(8,x-1,y) != -1) && !place_meeting(x-1,y,obj_boundary_moving) && !place_meeting(x-1,y,obj_enemy_spawner_barrier))
         && ((place_meeting(x+1,y,obj_boundary) || tile_layer_find(8,x+(32)+1,y) != -1) && !place_meeting(x+1,y,obj_boundary_moving) && !place_meeting(x+1,y,obj_enemy_spawner_barrier)))
        {
            image_index = 1;
        }
    }
}
else
{
    if ((!place_meeting(x-1,y,obj_boundary) && tile_layer_find(8,x-1,y) == -1) || place_meeting(x-1,y,obj_boundary_moving) || place_meeting(x-1,y,obj_enemy_spawner_barrier))
    {
        image_index = 11;
    }
    else if ((!place_meeting(x+1,y,obj_boundary) && tile_layer_find(8,x+(32)+1,y) == -1) || place_meeting(x+1,y,obj_boundary_moving) || place_meeting(x+1,y,obj_enemy_spawner_barrier))
    {
        image_index = 10;
    }
    else if (((place_meeting(x-1,y,obj_boundary) || tile_layer_find(8,x-1,y) != -1) || !place_meeting(x-1,y,obj_boundary_moving) && !place_meeting(x-1,y,obj_enemy_spawner_barrier))
         && ((place_meeting(x+1,y,obj_boundary) || tile_layer_find(8,x+(32)+1,y) != -1) || !place_meeting(x+1,y,obj_boundary_moving) && !place_meeting(x+1,y,obj_enemy_spawner_barrier)))
    {
        image_index = 9;
    }
}


