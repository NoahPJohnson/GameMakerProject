adjacentBoundaryBelow = instance_position(x,y+1,obj_boundary);
adjacentBoundaryAbove = instance_position(x,y-1,obj_boundary);
adjacentBoundaryLeft = instance_position(x-1,y,obj_boundary);
adjacentBoundaryRight = instance_position(x+1,y,obj_boundary);

if (adjacentBoundaryBelow != noone && adjacentBoundaryBelow.object_index != obj_boundary_moving && adjacentBoundaryBelow.object_index != obj_enemy_spawner_barrier)
{
    if (adjacentBoundaryAbove == noone || adjacentBoundaryAbove.object_index == obj_boundary_moving || adjacentBoundaryAbove.object_index == obj_enemy_spawner_barrier)
    {
        if (adjacentBoundaryLeft == noone || adjacentBoundaryLeft.object_index == obj_boundary_moving || adjacentBoundaryLeft.object_index == obj_enemy_spawner_barrier)
        {
            image_index = 6;
        }
        else if (adjacentBoundaryRight == noone || adjacentBoundaryRight.object_index == obj_boundary_moving || adjacentBoundaryRight.object_index == obj_enemy_spawner_barrier)
        {
            image_index = 8;
        }
        else if ((adjacentBoundaryLeft != noone && adjacentBoundaryLeft.object_index != obj_boundary_moving && adjacentBoundaryLeft.object_index != obj_enemy_spawner_barrier) 
            && (adjacentBoundaryRight != noone && adjacentBoundaryRight.object_index != obj_boundary_moving && adjacentBoundaryRight.object_index != obj_enemy_spawner_barrier))
        {
            image_index = 7;
        }
    }
    else if (adjacentBoundaryAbove != noone && adjacentBoundaryAbove.object_index != obj_boundary_moving && adjacentBoundaryAbove.object_index != obj_enemy_spawner_barrier)
    {
        if (adjacentBoundaryLeft == noone || adjacentBoundaryLeft.object_index == obj_boundary_moving || adjacentBoundaryLeft.object_index == obj_enemy_spawner_barrier)
        {
            image_index = 3;
        }
        else if (adjacentBoundaryRight == noone || adjacentBoundaryRight.object_index == obj_boundary_moving || adjacentBoundaryRight.object_index == obj_enemy_spawner_barrier)
        {
            image_index = 5;
        }
        else if ((adjacentBoundaryLeft != noone && adjacentBoundaryLeft.object_index != obj_boundary_moving && adjacentBoundaryLeft.object_index != obj_enemy_spawner_barrier) 
            && (adjacentBoundaryRight != noone && adjacentBoundaryRight.object_index != obj_boundary_moving && adjacentBoundaryRight.object_index != obj_enemy_spawner_barrier))
        {
            image_index = 4;
        }
    }
}
else if (adjacentBoundaryAbove != noone && adjacentBoundaryAbove.object_index != obj_boundary_moving && adjacentBoundaryAbove.object_index != obj_enemy_spawner_barrier)
{
    if (adjacentBoundaryBelow == noone || adjacentBoundaryBelow.object_index == obj_boundary_moving || adjacentBoundaryBelow.object_index == obj_enemy_spawner_barrier)
    {
        if (adjacentBoundaryLeft == noone || adjacentBoundaryLeft.object_index == obj_boundary_moving || adjacentBoundaryLeft.object_index == obj_enemy_spawner_barrier)
        {
            image_index = 0;
        }
        else if (adjacentBoundaryRight == noone || adjacentBoundaryRight.object_index == obj_boundary_moving || adjacentBoundaryRight.object_index == obj_enemy_spawner_barrier)
        {
            image_index = 2;
        }
        else if ((adjacentBoundaryLeft != noone && adjacentBoundaryLeft.object_index != obj_boundary_moving && adjacentBoundaryLeft.object_index != obj_enemy_spawner_barrier) 
            && (adjacentBoundaryRight != noone && adjacentBoundaryRight.object_index != obj_boundary_moving && adjacentBoundaryRight.object_index != obj_enemy_spawner_barrier))
        {
            image_index = 1;
        }
    }
}
else
{
    if (adjacentBoundaryLeft == noone || adjacentBoundaryLeft.object_index == obj_boundary_moving || adjacentBoundaryLeft.object_index == obj_enemy_spawner_barrier)
    {
        image_index = 11;
    }
    else if (adjacentBoundaryRight == noone || adjacentBoundaryRight.object_index == obj_boundary_moving || adjacentBoundaryRight.object_index == obj_enemy_spawner_barrier)
    {
        image_index = 10;
    }
    else if ((adjacentBoundaryLeft != noone && adjacentBoundaryLeft.object_index != obj_boundary_moving && adjacentBoundaryLeft.object_index != obj_enemy_spawner_barrier) 
        && (adjacentBoundaryRight != noone && adjacentBoundaryRight.object_index != obj_boundary_moving && adjacentBoundaryRight.object_index != obj_enemy_spawner_barrier))
    {
        image_index = 9;
    }
}


