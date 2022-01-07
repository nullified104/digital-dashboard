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
    
    /*Draw outer white circles
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
    ellipse(600,60,95,95);*/
  
    fill(255,0,0);
    noStroke();
    ellipse(600,50,80,80);
    
    fill(0);
    noStroke();
    ellipse(600,50,75,75);
    
    //Create text for the measured values
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(20);
    text("ODOMETER: ",320,465);
    text("KM", 455,465);
    text("Fuel Economy: ",330,505);
    text("KM/LITER", 510,505);
    text("RANGE: ", 670,465);
    text("KM", 800,465);;
    text("Fuel Consumption: ", 720,505);
    text("LITER/(100 KM)", 930,505);
    
    //Load gauge images
    PImage speedGauge = loadImage("gauge.png");
    speedGauge.resize(0,350);
    image(speedGauge, 425, 100);
    PImage otherGauge = loadImage("gauge2.png");
    otherGauge.resize(0,300);
    image(otherGauge, 125, 130);
    otherGauge.resize(0,300);
    image(otherGauge, 775, 130);
    PImage fuelIcon = loadImage("fuel.png");
    fuelIcon.resize(0, 50);
    image(fuelIcon, 905, 215);
    
    //Display units
    textSize(18);
    text("RPM",280,300);
    text("KM/H",600,300);
    text("LITER",925,325);
  
    //Display the measured values
    textSize(35);
    text(nf(r, 3, 1),280,265);
    text(nf(s, 2, 1),600,265);
    text(nf(f, 2, 1),925,290);
    
    textSize(20);
     text(o, 400, 465);
     text(nf(fuelEcon, 2, 2), 430, 505);
     text(nf(range, 3, 2), 740, 465);
     text(nf(fuelCon, 2, 2), 830, 505);
    
    textSize(30);
    
    //Direction of the vehicle
    if((x2 - x1) > 0)
    {
     if((y2 - y1) > 0)
     {
       text("NE",600,50);
     }
     else if((y2 - y1) == 0)
     {
       text("E",600,50);
     }
     else if((y2 - y1) < 0)
     {
       text("SE",600,50);
     }
    }
    else if((x2 - x1) < 0)
    {
     if((y2 - y1) > 0)
     {
       text("NW",600,50);
     }
     else if((y2 - y1) == 0)
     {
       text("W",600,50);
     }
     else if((y2 - y1) < 0)
     {
       text("SW",600,50);
     }
    }
    else if((x2 - x1) == 0)
    {
     if((y2 - y1) > 0)
     {
       text("N",600,50);
     }
     else if ((y2 - y1) < 0)
     {
       text("S",600,50);
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
