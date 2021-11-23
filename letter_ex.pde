//most coding taught and learnt from nick//
lettergen lg;
String input = "abc";

void setup() {
  size(800, 600, P3D);
  lg = new lettergen(input, 0, height/2);
}

void draw() {
  background(150);
  
  lg.run(); 
}
