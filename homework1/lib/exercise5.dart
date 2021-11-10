//Упражнение 5
//Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого.
// Реализуйте метод, возвращающий цифры без повторений, которые встречаются
// в данной строке. Однако цифры встречаются в виде английских слов от zero
// до nine. Например, в результате строки ‘one, two, zero, zero’
// мы получим следующий результат: [1, 2, 0]. Если в строке есть слова,
// не являющиеся цифрами от 0 до 9, пропускайте их.

//enum digitName {zero,one,two,three,four,five,six,seven,eight,nine}
class CounterNumbers {
  static const _digitName=['zero','one','two','three','four','five','six','seven','eight','nine'];

  static List<List<int>> counterNumbers(List<String> stringsList) {
    List<List<int>> result=[];
    var re = RegExp(r"\s*,\s*");
    
    for (var strList in stringsList) {
      List<String> str=strList.split(re);
      List<String> n=[];

      n.addAll(_digitName);
      result.add([]);

      for (var s in str) {
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