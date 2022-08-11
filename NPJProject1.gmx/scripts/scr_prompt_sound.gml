///Prompt the music and sfx manager to play a sound
sound_to_play = argument0;
sound_source = argument1;
loop = argument2;

camera_field_buffer = 180;
camera_field_x_left = view_xview[0]-camera_field_buffer;
camera_field_x_right = view_xview[0] + view_wview[0]+camera_field_buffer;
camera_field_y_top = view_yview[0]-camera_field_buffer;
camera_field_y_bottom = view_yview[0] + view_hview[0]+camera_field_buffer;

if (sound_source.x > camera_field_x_left && sound_source.x < camera_field_x_right &&
    sound_source.y > camera_field_y_top && sound_source.y < camera_field_y_bottom) 
{
    audio_play_sound(sound_to_play, sfx_priority, loop);
    if (sfx_priority > 1)
    {
        sfx_priority -= 1;
    }
    else 
    {
        sfx_priority = sfx_priority_limit;
    } 
}
