

import 'dart:ffi';
import 'dart:io';
//1
void main() {
  var input = stdin;
  print('Введите строку:');
  String hello = input.readLineSync() ?? '';

  print('Введите строку:');
  String world = input.readLineSync() ?? '';
  String res = hello + world;
  print('Result: $res');


  //2
  print('Введите строку:');
  String word2 = input.readLineSync() ?? '';

  String rev = reverse(word2);
  print('Перевернутая строка: $rev');


//3
  print('Введите строку:');
  String word3 = input.readLineSync() ?? '';
  int characterCount = countCharacters(word3);

  print('Количество символов (без пробелов): $characterCount');


  //4
  print('Введите строку:');
  String mainString = input.readLineSync() ?? '';

  print('Введите подстроку для поиска:');
  String searchString = input.readLineSync() ?? '';

  List<int> indices = findSubstringIndices(mainString, searchString);


  if (indices.isEmpty) {
    print('Подстрока не найдена.');
  } else {
    print('Индексы первого вхождения подстроки: $indices');
  }
}






//2 function
String reverse(String input) {
  return String.fromCharCodes(input.runes.toList().reversed);
}



//3 function
int countCharacters(String input) {
  List<String> characters = input.split('');
  Iterable<String> nonSpaceCharacters = characters.where((char) =>
  char
      .trim()
      .isNotEmpty);
  return nonSpaceCharacters.length;
}



//4 function

List<int> findSubstringIndices(String mainString, String searchString) {
  List<int> indices = [];
  int index = mainString.indexOf(searchString);

  while (index != -1) {
    indices.add(index);
    index = mainString.indexOf(searchString, index + 1);
  }

  return indices;
}