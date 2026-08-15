if (sprite_index == sprite_shoot)
{
    sprite_index = sprite_idle;
}
if  ( keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D")))
{
	sprite_index = sprite_walk
}
else
{
	sprite_index = sprite_idle;
}