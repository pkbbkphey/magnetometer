  /*
   * CODE BY PBK IN 2023.3
   * work with the .pde file in this folder
   * visualizing the magnetic field using gy-271(QMC5883L), a magnetometer
   */
  #include <Wire.h>
  #include <QMC5883LCompass.h>
  QMC5883LCompass compass;

  int compass_x;
  int compass_y;
  int compass_z;

  void setup(){
    Serial.begin(9600);
    Wire.begin();
    compass.init();
  }

  void loop(){
    compass.read();
    compass_x = compass.getX();
    compass_y = compass.getY();
    compass_z = compass.getZ();
    Serial.print(compass_x); Serial.print(','); Serial.print(compass_y); Serial.print(','); Serial.println(compass_z);
    
    delay(50);
  }

  
