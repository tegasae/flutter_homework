class CounterWords {
  static Map<String, int> counter(List<String> list) {
      var collectionWords=<String, int>{};
      for (var i in list) {
        if (!collectionWords.containsKey(i)) {
          collectionWords[i]=0;
        }
        collectionWords[i]=collectionWords[i]!+1;
      }
      return collectionWords;
  }
}