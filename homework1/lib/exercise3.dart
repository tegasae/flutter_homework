class NumbersCollection {
  static List<num> getNumbers(String str) {
    RegExp regExp = new RegExp(
      r"(\d+)",
      caseSensitive: false,
      multiLine: true,
    );
    Iterable<RegExpMatch> matches = regExp.allMatches(str);
    for (final i in matches) {
      print(i.toString());
    }
    return [];
  }
}