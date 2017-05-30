class Recorder {

  PrintWriter output; 

  Recorder() {
    output = createWriter(String.format("./recordings/SoundBath_%d", (System.currentTimeMillis() / 1000L)));
  }

  void recordArduino(SacredArduino arduino) {
    output.println(String.format("%d,%d,%d,%d,%d,%d,%d", arduino.n, arduino.nw, arduino.sw, arduino.s, arduino.se, arduino.ne, arduino.millis));
  }
}