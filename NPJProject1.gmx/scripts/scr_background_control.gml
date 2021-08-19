for (bkg_index = 0; bkg_index < bkg_count; bkg_index++)
{
     show_debug_message("background Y = " + string(view_yview[0]) + " / " + string(room_height));
     show_debug_message("computed Y VALUE: " + string(((view_yview[0]/room_height)*(room_height-background_height[0]))));
     background_x[bkg_index] = view_xview[0]/1.1;//(camera_center_x-(camera_center_x-obj_player.x));
     background_y[bkg_index] = (((view_yview[0]+900)/room_height)*(room_height-background_height[bkg_index]));
}
