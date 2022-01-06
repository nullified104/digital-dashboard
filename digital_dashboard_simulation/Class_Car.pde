class Car
{
  TripComputer trip;
  FuelTank fuel;
  FuelComputer fuelComp;
  int RPM;
  float fuelLevel;
  float gearRatio;
  float radius;
  int tankCapacity;
  
  Car(int r, float f, float g, float rad, int t, float prevFuel, float currentFuel)
  {
  trip = new TripComputer(r,g,rad);
  fuel = new FuelTank(t,f,prevFuel,currentFuel);
  fuelComp = new FuelComputer(trip.totalTravelledDistance,fuel.consumedFuel);
  RPM = trip.RPM;
  fuelLevel = fuel.fuelLevel;
  gearRatio = trip.gearRatio;
  radius = trip.radius;
  tankCapacity = fuel.tankCapacity;
  }
  
  void processInput(int r, float g, float prevFuel, float curFuel)
  {
    RPM = r;
    fuel.consumedFuel = fuel.getConsumedFuel(prevFuel,curFuel);
    gearRatio = g;
    radius = trip.radius;
    tankCapacity = fuel.tankCapacity;
    trip.speed = trip.getCurrentSpeed(RPM,gearRatio);
    trip.totalTravelledDistance = trip.totalTravelledDistance();
    fuelComp.fuelEconomy = fuelComp.calculateFuelEconomy(trip.totalTravelledDistance-trip.prevDistance,fuel.consumedFuel);
    fuelComp.avgFuelEconomy = fuelComp.calculateAverageFuelEconomy();
    fuelComp.fuelConsumption = fuelComp.calculateFuelConsumption();
    fuelComp.remainingFuelLevel = curFuel;
    fuelComp.range = fuelComp.calculateRange();
    trip.odometer = trip.totalTravelledDistance;
    
  }
}
