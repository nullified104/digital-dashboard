import org.gicentre.utils.stat.*;
import javax.swing.JOptionPane;
BarChart avgFuelGraph;
BarChart conFuelGraph;

SensorDataProvider sensor = new SensorDataProvider();
Car vehicle; 
Gauge screenV;

String select;
float radius;
int tank;
int indexAvg = 0;
int indexCon = 0;
float [] avgFuel = new float [60];
float [] conFuel = new float [40];

void setup()
{
  size(1200,800);
  frameRate(60);

  select = JOptionPane.showInputDialog("Please enter 1 for the BMW, 2 for the F150, or 3 to exit.");
  int n = Integer.parseInt(select);
  if(n == 1)
  {
    radius = 0.23;
    tank = 60;
    sensor.Initialize("car_status_BMW_323i.csv");
  }
  else if(n == 2)
  {
    radius = 0.254;
    tank = 80;
    sensor.Initialize("car_status_Truck_F150.csv");
  }
  else
  {
    exit();
  }
  
  vehicle = new Car(sensor.readRPM(), sensor.readFuelLevel(sensor.currentIndex), sensor.readRatio(), radius, tank, sensor.readFuelLevel(sensor.currentIndex-1), sensor.readFuelLevel(sensor.currentIndex)); 
  screenV = new Gauge();
  avgFuelGraph = new BarChart(this);
  conFuelGraph = new BarChart(this);
}

void draw()
{
  if(sensor.currentIndex < 599)
  {
    vehicle.processInput(sensor.readRPM(), sensor.readRatio(), sensor.readFuelLevel(sensor.currentIndex-1), sensor.readFuelLevel(sensor.currentIndex));
    screenV.display(sensor.readX(sensor.currentIndex-1), sensor.readY(sensor.currentIndex-1), sensor.readX(sensor.currentIndex), sensor.readY(sensor.currentIndex), sensor.readRPM(), vehicle.trip.speed, sensor.readFuelLevel(sensor.currentIndex), vehicle.trip.odometer, vehicle.fuelComp.avgFuelEconomy, vehicle.fuelComp.range, vehicle.fuelComp.fuelConsumption);
    if(indexAvg < 60)
    {
      avgFuel[indexAvg] = vehicle.fuelComp.calculateAverageFuelEconomy();
      indexAvg++;
    }
    else 
    {
      for(int i = 0; i < 59; i++)
      {
        avgFuel[i] = avgFuel[i+1];
      }
      indexAvg--;
      avgFuel[indexAvg] = vehicle.fuelComp.calculateAverageFuelEconomy();
    }
    
    if(indexCon < 40)
    {
      conFuel[indexCon] = vehicle.fuelComp.calculateFuelConsumption();
      indexCon++;
    }
    else 
    {
      for(int i = 0; i < 39; i++)
      {
        conFuel[i] = conFuel[i+1];
      }
      indexCon--;
      conFuel[indexCon] = vehicle.fuelComp.calculateFuelConsumption();
    }
    
    avgFuelGraph.setData(avgFuel);
    conFuelGraph.setData(conFuel);
    avgFuelGraph.showCategoryAxis(false);
    conFuelGraph.showCategoryAxis(false);
    avgFuelGraph.draw(75,550,500,180);
    conFuelGraph.draw(625,550,500,180);
    println(vehicle.trip.totalTravelledDistance + "   " + vehicle.fuel.consumedFuel);
    sensor.readNext(); 
  }
  else
  {
   background(0);
   reset();
  }
}

void reset()
{
  println("RESET");
  sensor.currentIndex = 0;
  select = JOptionPane.showInputDialog("Please enter 1 for the BMW, 2 for the F150, or 3 to exit.");
  int n = Integer.parseInt(select);
  if(n == 1)
  {
    radius = 0.23;
    tank = 60;
    sensor.Initialize("car_status_BMW_323i.csv");
  }
  else if(n == 2)
  {
    radius = 0.254;
    tank = 80;
    sensor.Initialize("car_status_Truck_F150.csv");
  }
  else if(n == 3)
  {
    exit();
  }
  vehicle = new Car(sensor.readRPM(), sensor.readFuelLevel(sensor.currentIndex), sensor.readRatio(), radius, tank, sensor.readFuelLevel(sensor.currentIndex-1), sensor.readFuelLevel(sensor.currentIndex)); 
  screenV = new Gauge();
  avgFuelGraph = new BarChart(this);
  conFuelGraph = new BarChart(this);

}
