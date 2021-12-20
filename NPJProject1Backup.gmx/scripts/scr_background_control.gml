for (bkg_index = 0; bkg_index < bkg_count; bkg_index++)
{
    if (bkg_relative_x_list[bkg_index])
    {
        background_x[bkg_index] = (((view_xview[0])/(room_width-view_wview[0]))*(room_width-background_width[bkg_index]) + bkg_offset_x_list[bkg_index]);
    }
    else
    {
        background_x[bkg_index] = view_xview[0]/(bkg_index+0.5);
    }
    
    if (bkg_relative_y_list[bkg_index])
    {
        background_y[bkg_index] = (((view_yview[0])/(room_height-view_hview[0]))*(room_height-background_height[bkg_index]) + bkg_offset_y_list[bkg_index]);
    }
    else
    {
        background_y[bkg_index] = view_yview[0]/(bkg_index+0.5);
    }
}
