///scr_score_tracker_script_ball()

obj_scoring_manager.balls += 1;

if (obj_scoring_manager.balls > 3)
   {
    obj_scoring_manager.balls = 0;
    for (i = 2; i > -1; i --)
        {
         if (obj_scoring_manager.bases_array[i] > 0)
            {
             obj_scoring_manager.bases_array[i] += 1;
             if (obj_scoring_manager.bases_array[i] > 3)
                {
                 obj_scoring_manager.runs += 1;
                 obj_scoring_manager.bases_array[i] = 0;
                }
            }
       }
    for (i = 0; i < 3; i ++)
        {
         if (obj_scoring_manager.bases_array[i] == 0)
            {
             obj_scoring_manager.bases_array[i] += 1;
             if (obj_scoring_manager.bases_array[i] > 3)
                {
                 obj_scoring_manager.runs += 1;
                 obj_scoring_manager.bases_array[i] = 0;
                }
             break;
            }
        }
   }
   
for (i = 0; i < 3; i ++)
    {
     obj_scoring_manager.sprites_array[i] = false;
    }
    
for (i = 0; i < 3; i ++)
    {
     if (obj_scoring_manager.bases_array[i] > 0)
        {
         obj_scoring_manager.sprites_array[obj_scoring_manager.bases_array[i]-1] = true;
        }
    }
if (obj_scoring_manager.bases_array[0] != 0 || obj_scoring_manager.bases_array[1] != 0 || obj_scoring_manager.bases_array[2] != 0)
   {
    obj_scoring_manager.alarm[0] = obj_scoring_manager.out_time;
   }
