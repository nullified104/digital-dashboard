class FuelTank
{
 int tankCapacity;
 float previousFuelLevel;
 float fuelLevel;
 float consumedFuel;
 
 
 FuelTank(int t, float f, float prevFuel, float currentFuel)
 {
   tankCapacity = t;
   fuelLevel = f;
   consumedFuel = getConsumedFuel(prevFuel,currentFuel);
 }
 
 float getConsumedFuel(float p, float c)
 {
   consumedFuel = p - c;
   return consumedFuel;
 }


}
