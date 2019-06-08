class Items {

  List<String> items = <String>[];

  List<String> getItems(){
    return items;
  }

  Items add(String value){
    items.add(value);
    return this;
  }

  void single(String message){
    init();
    items.add(message);
  }

  Items init(){
    items = <String>[];
    return this;
  }
}