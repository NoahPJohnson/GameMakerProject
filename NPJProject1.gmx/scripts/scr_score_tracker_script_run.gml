///scr_score_tracker_script_run(strength, enemy_destroyed, enemy_crash)
strength = argument0;
enemy_destroyed = argument1;
enemy_crash = argument2;


if (enemy_crash == false)
   {
    if (enemy_destroyed == true)
       {
        strength += 1;
       }
    for (i = 2; i > -1; i--)
        {
         if (obj_scoring_manager.bases_array[i] > 0)
            {
             //Cap non permanent bases at 4 so they don't mistakenly become permanent and cause an error
             if (obj_scoring_manager.bases_array[i] < 5)
                {
                 obj_scoring_manager.bases_array[i] += strength;
                 obj_scoring_manager.bases_array[i] = clamp(obj_scoring_manager.bases_array[i],0,4);
                }
             //Cap permanent bases at 9 so they don't reset their number and avoid getting counted as runs
             else if (obj_scoring_manager.bases_array[i] > 5)
                {
                 obj_scoring_manager.bases_array[i] += strength;
                 obj_scoring_manager.bases_array[i] = clamp(obj_scoring_manager.bases_array[i],6,9);
                }
             //So if the mod result is 4, revert it to zero and add a run to the player's score
             if ((obj_scoring_manager.bases_array[i] % 5) > 3)
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
             obj_scoring_manager.bases_array[i] += strength;
             //Just to be safe, cap the new runner too
             obj_scoring_manager.bases_array[i] = clamp(obj_scoring_manager.bases_array[i],0,4);
             if ((obj_scoring_manager.bases_array[i] % 5) > 3)
                {
                 obj_scoring_manager.runs += 1;
                 obj_scoring_manager.bases_array[i] = 0;
                }
             break;
            }
        }
     
    for (i = 0; i < 3; i ++)
        {
         obj_scoring_manager.sprites_array[i] = false;
         obj_scoring_manager.permanent_sprites_array[i] = false;
        }
    
    for (i = 0; i < 3; i ++)
        {
         if (obj_scoring_manager.bases_array[i] > 0)
            {
             obj_scoring_manager.sprites_array[(obj_scoring_manager.bases_array[i]%5)-1] = true;
            }
         if (obj_scoring_manager.bases_array[i] > 5)
            {
             obj_scoring_manager.sprites_array[(obj_scoring_manager.bases_array[i]%5)-1] = false;
             obj_scoring_manager.permanent_sprites_array[(obj_scoring_manager.bases_array[i]%5)-1] = true;
            }
        }
   }
if (obj_scoring_manager.bases_array[0] != 0 && obj_scoring_manager.bases_array[0] < 5 || obj_scoring_manager.bases_array[1] != 0 && obj_scoring_manager.bases_array[1] < 5 || obj_scoring_manager.bases_array[2] != 0 && obj_scoring_manager.bases_array[2] < 5)
   {
    obj_scoring_manager.alarm[0] = obj_scoring_manager.out_time;
   }

