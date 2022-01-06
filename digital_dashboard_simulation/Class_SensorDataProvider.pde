class SensorDataProvider
{
  String filePath;
  Table dataTable;
  int currentIndex;
  
  SensorDataProvider()
  {
    dataTable = null;
    filePath = null;
    currentIndex = 0;
  }
  
  void Initialize(String fileName)
  {
    filePath = fileName;
    dataTable = loadTable(filePath, "header");
  }
  
  void readNext()
  {
    currentIndex++; 
  }
  
  int readRPM()
  {
    int RPM = dataTable.getRow(currentIndex).getInt("RPM");
    return RPM;
  }
  
  float readFuelLevel(int i)
  {
    float FuelLevel;
    if(i >= 0)
    {
      FuelLevel = dataTable.getRow(i).getFloat("Fuel Level (liter)");
      return FuelLevel;
    }
    else
    {
      FuelLevel = 50;
      return FuelLevel;
    }
  
  }
  
  float readRatio()
  {
    float Ratio = dataTable.getRow(currentIndex).getFloat("Gear Ratio");
    return Ratio;
  }
  
  float readX(int i)
  {
    float X;
    if(i >= 0)
    {
      X = dataTable.getRow(i).getFloat("X");
      return X;
    }
    else 
    {
      X = 0;
      return X;
    }
  }
  
  float readY(int i)
  {
    float Y;
    if(i >= 0)
    {
      Y = dataTable.getRow(i).getFloat("Y");
      return Y;
    }
    else 
    {
      Y = 0;
      return Y;
    }
  }
}
