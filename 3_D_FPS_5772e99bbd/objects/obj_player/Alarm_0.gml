while !(z <= base_z)
{
	z -= z / 9.81;
}
if (z < base_z)
{
	z = base_z;
}