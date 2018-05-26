if (obj_player.right = true)
   {
    if (place_meeting(x,y, obj_hit_cone))
       {
        if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
           {
            if (instance_place(x,y,obj_test) = noone)
               {
                instance_create(x,y,obj_test);
               }
           }
       }
   }

else
   {
    if (place_meeting(x,y,obj_hit_cone))
       {
        if (!collision_line(x,y,obj_player.x,obj_player.y,obj_boundary,false,true))
           {
            if (instance_place(x,y,obj_test) = noone)
               {
                instance_create(x,y,obj_test);
               }
           }
       }
   }
        
