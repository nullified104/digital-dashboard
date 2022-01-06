class Gauge
{
  int min;
  int max;
  float currentValue;
  String direction; 
  boolean check;
 
  Gauge()
  {
    min = 0;
    max = 3000;
    currentValue = 0;
  }
  
  void display(float x1, float y1, float x2, float y2, float r, float s, float f, float o, float fuelEcon, float range, float fuelCon)
  {
    background(0);
    //Draw outer white circles
    fill(255);
    noStroke();
    ellipse(300,250,250,250);
    ellipse(600,250,250,250);
    ellipse(900,250,250,250);
    ellipse(600,60,100,100);
  
    //Draw inner black circles
    fill(0);
    noStroke();
    ellipse(300,250,240,240);
    ellipse(600,250,240,240);
    ellipse(900,250,240,240);
    ellipse(600,60,95,95);
  
    //Create text for the measured values
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(20);
    text("RPM:",300,390);
    text("SPEED (KM/H)",600,390);
    text("Fuel (LITER)",900,390);
    text("ODOMETER: ",320,440);
    text("KM", 465,440);
    text("Fuel Economy: ",330,480);
    text("KM/LITER", 510,480);
    text("RANGE: ", 670,440);
    text("KM", 800,440);;
    text("Fuel Consumption: ", 720,480);
    text("LITER/(100 KM)", 930,480);
    
  
    //Display the measured values
    textSize(35);
    text(nf(r, 3, 1),300,250);
    text(nf(s, 2, 1),600,250);
    text(nf(f, 2, 1),900,250);
    
    textSize(20);
     text(o, 400, 440);
     text(nf(fuelEcon, 2, 2), 430, 480);
     text(nf(range, 3, 2), 740, 440);
     text(nf(fuelCon, 2, 2), 830, 480);
    
    textSize(35);
    
    //Direction of the vehicle
    if((x2 - x1) > 0)
    {
     if((y2 - y1) > 0)
     {
       text("NE",600,60);
     }
     else if((y2 - y1) == 0)
     {
       text("E",600,60);
     }
     else if((y2 - y1) < 0)
     {
       text("SE",600,60);
     }
    }
    else if((x2 - x1) < 0)
    {
     if((y2 - y1) > 0)
     {
       text("NW",600,60);
     }
     else if((y2 - y1) == 0)
     {
       text("W",600,60);
     }
     else if((y2 - y1) < 0)
     {
       text("SW",600,60);
     }
    }
    else if((x2 - x1) == 0)
    {
     if((y2 - y1) > 0)
     {
       text("N",600,60);
     }
     else if ((y2 - y1) < 0)
     {
       text("S",600,60);
     }
    }  
    
    avgFuelGraph.setMinValue(0);
    avgFuelGraph.setMaxValue(30);
    avgFuelGraph.showValueAxis(true);
    avgFuelGraph.setValueFormat("#");
    avgFuelGraph.showCategoryAxis(false);
    avgFuelGraph.setBarColour(color(250,100,20,200));
    avgFuelGraph.setBarGap(4);
    textSize(15);
    text("Average Fuel Economy (km/liter) over time (sec)",375,750);
    
    conFuelGraph.setMinValue(0);
    conFuelGraph.setMaxValue(30);
    conFuelGraph.showValueAxis(true);
    conFuelGraph.setValueFormat("#");
    conFuelGraph.showCategoryAxis(false);
    conFuelGraph.setBarColour(color(250,100,20,200));
    conFuelGraph.setBarGap(4);
    textSize(15);
    text("Fuel Consumption (liter) over time (liter/sec)",950,750);
  }
}
