

import processing.serial.*;

Serial myPort;  // Create object from Serial class
static String val;    // Data received from the serial port
int sensorVal = 0;
int toucheGrise = 0;

int value = 255;
  
int x  = 0;
int x2 = 40;
int a = 4;

void setup(){
    size(1000, 700);
    background(0);
    
  String portName = "/dev/cu.usbserial-AB0O25X9";// Change the number (in this case ) to match the corresponding port number connected to your Arduino. 
  myPort = new Serial(this, portName, 9600);
  loop();
  
}


void draw(){
  
    if ( myPort.available() > 0) {  // If data is available,
    val = myPort.readStringUntil('\n'); 
    try {
     sensorVal = Integer.valueOf(val.trim());
    }
    catch(Exception e) {
    ;
    }
    println(sensorVal);// read it and store it in vals!
    }  
    
    
   
   float c = map(sensorVal, 0, 255, 0, 16);
   
   frameRate(30);
   fill(255);
   textSize(128);
   text(int(c), 40, 120);
   
   
  
    
   for (int i = 0; i< 17; i++) {
     
     if(int(c) == i){
       fill(125);
     }
     else{
       fill(255);
       
     }
     
   rect(x, 500, 58, 200, 0, 0, 5,5);
   x +=60;
    
  }
  
   for (int j = 0 ; j< 12; j++){
    fill(0);
    rect(x2, 500, 40, 120);
    x2 += 60;
    if (x2 == 160 || x2 == 400 || x2 == 580 || x2 == 820){
      x2 +=60;
    }
  }
  
}
