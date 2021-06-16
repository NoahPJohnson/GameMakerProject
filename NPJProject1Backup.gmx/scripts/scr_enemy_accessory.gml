x = enemy_parent.x + x_offset;
y = enemy_parent.y + y_offset;

if (follow_player == true)
{
    image_angle = point_direction(x,y,obj_player.x,obj_player.y);
}
