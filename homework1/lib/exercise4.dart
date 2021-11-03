//Упражнение 4
//Есть коллекция слов. Реализуйте метод, возвращающий Map.
//Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.
class CounterWords {
  static Map<String, int> counter(List<String> list) {
      var collectionWords=<String, int>{};
      for (final String i in list) {
        if (!collectionWords.containsKey(i)) {
          collectionWords[i]=0;
        }
        collectionWords[i]=collectionWords[i]!+1;
      }
      return collectionWords;
  }
}