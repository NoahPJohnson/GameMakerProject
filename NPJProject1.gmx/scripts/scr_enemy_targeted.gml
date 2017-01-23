if (obj_player.right = true)
   {
    if (place_meeting(x,y, obj_hit_cone))
       {
        if (instance_place(x,y,obj_test) = noone)
           {
            instance_create(x,y,obj_test);
           }
       }
   }

else
   {
    if (place_meeting(x,y,obj_hit_cone))
       {
        if (instance_place(x,y,obj_test) = noone)
           {
            instance_create(x,y,obj_test);
           }
       }
   }
        
