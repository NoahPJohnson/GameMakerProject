///Prompt the music and sfx manager to play a sound
sound_to_stop = argument0;

sound_to_return = noone;

if (audio_is_playing(sound_to_stop)) 
{
    sound_to_return = audio_stop_sound(sound_to_stop);
}

return sound_to_return;
