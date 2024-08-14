String integerPart(double? valor) {
  String numeroCompleto = valor.toString();
  return numeroCompleto.substring(0, numeroCompleto.length - 3);
}

String decimalPart(double? valor) {
  String numeroCompleto = valor.toString();
  return numeroCompleto.substring(numeroCompleto.length - 2);
}

String tempoRestante(DateTime horaFinal) {
  return '';
}