///scr_score_tracker_script_strike()

obj_scoring_manager.strikes += 1;

if (obj_scoring_manager.strikes > 2)
   {
    for (i = 0; i < 3; i ++)
        {
         obj_scoring_manager.bases_array[i] = 0;
        }
    obj_scoring_manager.balls = 0;
    for (i = 0; i < 3; i ++)
        {
         obj_scoring_manager.sprites_array[i] = false;
         obj_scoring_manager.permanent_sprites_array[i] = false;
        }
    obj_scoring_manager.strikes = 0;
   }

    
