
import 'dart:ffi';
import 'dart:io';

void main(){
  var num = stdin;

  print('Введите первое число:');
  int number1 = int.parse(num.readLineSync() ?? '0');
  print('Введите оператор:');
  String s = num.readLineSync() ?? '';
  switch(s){
    case "+":
      print('Введите второе число:');
      int number2 = int.parse(num.readLineSync() ?? '0');
      int sum = number1+number2;
      print('Result: $sum');
      break;

    case "-":
      print('Введите второе число:');
      int number2 = int.parse(num.readLineSync() ?? '0');
      int sum = number1-number2;
      print('Result: $sum');
      break;

    case "*":
      print('Введите второе число:');
      int number2 = int.parse(num.readLineSync() ?? '0');
      int sum = number1*number2;
      print('Result: $sum');
      break;

    case "/":
      print('Введите второе число:');
      int number2 = int.parse(num.readLineSync() ?? '0');
      if(number2==0)
        break;
      double sum = number1 /number2;
      print('Result: $sum');
      break;
  }



}