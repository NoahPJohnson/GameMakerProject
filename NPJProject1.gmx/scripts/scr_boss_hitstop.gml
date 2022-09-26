hspd = 0;
vspd = 0;
speed = 0;
direction = 0;
weakpoint.hspd = 0;
weakpoint.vspd = 0;
if (hp >= 1)
{
    weakpoint.speed = 0;
    weakpoint.direction = 0;
}
appendage.hspd = 0;
appendage.vspd = 0;
blocker.hspd = 0;
blocker.vspd = 0;
hp = weakpoint.hp;

//Sparks
if (hp < 1 && object_index == obj_boss_main_body)
{
    if (alarm[0] mod spark_interval >= 0 && alarm[0] mod spark_interval < 3)
    {
        spark_interval = random_range(4,6);
        spark_offset_x = random_range(-80,80);
        spark_offset_y = random_range(-120,120);
        
        var spark_selection = irandom(5)
        if (spark_selection < 3)
        {
            instance_create(x+spark_offset_x,y+spark_offset_y,obj_spark_effect2);
        }
        else if (spark_selection < 4)
        {
            instance_create(x+spark_offset_x,y+spark_offset_y,obj_spark_effect1);
        }
        else
        {
            instance_create(x+spark_offset_x,y+spark_offset_y,obj_spark_effect3);
        }
    }
    if (alarm[0] < 13)
    {
        instance_create(x,y,obj_spark_effect4);
    }
}

//Collision
scr_boss_collision();

