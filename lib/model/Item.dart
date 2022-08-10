class Item{
  String _ID;
  int _Cost;
  int _Count = 0;

  Item(this._ID,this._Cost);
  void set ID(String value) {
    _ID = value;
  }

  String get ID {
    return _ID;
  }

  void set Cost(int value) {
    _Cost = value;
  }

  int get Cost {
    return _Cost;
  }

  void set Count(int value) {
    _Count = value;
  }

  int get Count {
    return _Count;
  }

}