//Упражнение 3
//Реализуйте метод, который принимает строку слов, разделённых пробелами.
// Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
class NumbersCollection {
  static List<num> getNumbers(String str) {
    List<num> results=[];

    final RegExp regExp = new RegExp(
      r"(?<=\s+|^)([-+]?\d+(\.\d*)?)(\s+|$)",
      caseSensitive: false,
      multiLine: true,
    );

    final Iterable<RegExpMatch> matches = regExp.allMatches(str);
    for (final i in matches) {
      final String? r=i.group(0);
      if (r != null) {
        results.add(num.parse(r));
      }
    }
    return results;
  }
}