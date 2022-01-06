class FuelComputer
{
  float fuelEconomy;
  float fuelConsumption;
  float fuelEconomyHistory;
  float range;
  float remainingFuelLevel;
  float totalFuelEconomy;
  int numberOfFuelEconomy;
  float avgFuelEconomy;
  float fuelAvgEcon [] = new float [60];
  float [] fuelCon = new float [40];

   
  FuelComputer(float distance, float consumedFuel)
  {
    fuelEconomy = calculateFuelEconomy(distance,consumedFuel);
    range = 0;
    remainingFuelLevel = 0;
    totalFuelEconomy = 0;
    numberOfFuelEconomy = 0;
    avgFuelEconomy = calculateAverageFuelEconomy();
    fuelConsumption = calculateFuelConsumption();
  }
  
  float calculateFuelEconomy(float distance, float consumedF)
  {
    if(consumedF != 0)
    {
      fuelEconomy = distance/consumedF;
      return fuelEconomy;
    }
    else 
    {
      fuelEconomy = 0;
      return fuelEconomy;
    }
  }
  
  float calculateAverageFuelEconomy()
  {  
    totalFuelEconomy+=fuelEconomy;
    numberOfFuelEconomy++;
    avgFuelEconomy = totalFuelEconomy/numberOfFuelEconomy;
    return avgFuelEconomy;
  }
  
  float calculateFuelConsumption()
  {
    fuelConsumption = (1/(avgFuelEconomy))*100;
    return fuelConsumption;
  }
  
  float calculateRange()
  {
    range = avgFuelEconomy*remainingFuelLevel*3;
    return range;
  }
}
