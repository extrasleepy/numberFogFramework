public void export() {
  println("export");
  record = true;
}

public void randomize() {
  println("randomize");
  setup();
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$tm%1$td%1$ty_%1$tH%1$tM%1$tS", now);
}
