class TripComputer
{
  int RPM;
  float gearRatio;
  float radius;
  float speed;
  float prevDistance;
  float totalTravelledDistance;
  float odometer;

  TripComputer(int r, float g, float rad)
  {
    RPM = r;
    gearRatio = g;
    radius = rad;
    speed = 0;
    prevDistance = 0;
    totalTravelledDistance = 0;
    odometer = totalTravelledDistance;
  } 
  
  float getCurrentSpeed(int RPM, float gearRatio)
  {
    speed = (float(RPM)/60)*((1/gearRatio)*2*PI*radius);
    speed = speed*3600/1000;
    return speed;
  }
  
  float totalTravelledDistance()
  {
    prevDistance = totalTravelledDistance;
    totalTravelledDistance = totalTravelledDistance + speed/3600;
    return totalTravelledDistance;
  }
}
