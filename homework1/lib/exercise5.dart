

class CounterNumbers {
  static var digitName=['zero','one','two','three','four','five','six','seven','eight','nine'];
  static List<List<int>> counterNumbers(List<String> stringsList) {

    List<List<int>> result=[];
    var re = RegExp(r"\s*,\s*");
    
    for (var strList in stringsList) {
      List<String> str=strList.split(re);

      List<String> n=[];
      n.addAll(digitName);

      result.add([]);
      for (var s in str) {
        print(s);
        int i=n.indexOf(s);
        if (i>=0) {
          result.last.add(i);
          n[i]='';
        }
      }
    }
    return result;

  }
}