import 'package:flutter/material.dart';
import 'package:jackercleaning/constants.dart';
import 'package:jackercleaning/main.dart';
import 'package:jackercleaning/model/Item.dart';

class Comfirm extends StatefulWidget {
  Item item ;
  Comfirm(this.item);

  @override
  _ComfirmState createState() => _ComfirmState();
}

class _ComfirmState extends State<Comfirm> {
  Item item;
  int cost;

  @override
  void initState() {
    item = widget.item;
    cost = item.Count * item.Cost;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("確認價格",style: TextStyle(color: Colors.white)),
          leading:
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
                onPressed: () { Navigator.of(context).pop();},
              );
            },
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              _order(),
              _service(),
              _workerView(),
              _icon(),
              _billbotton(),
            ],
          ),

        ),
    );
  }
  Widget _leader() =>Container(
    height: 25.0,
    width: 25.0,
    child: IconButton(
        color: colorCustom,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: new EdgeInsets.all(0.0),
        onPressed: () {
        },
        icon: const Icon(Icons.filter_list)),
  );
  Widget _order() =>Container(
    padding: EdgeInsets.all(15),
    alignment:Alignment.centerLeft,
    child: Text(
      "訂單內容",
      style: LabelBlack54TextStyle,
    ),
  );
  Widget _service() =>Container(
    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
    alignment:Alignment.centerLeft,
    child: Text(
      "服務項目",
      style: BlackTextStyle,
    ),
  );

  Widget _workerView() => Container(
    padding: EdgeInsets.all(15),
    child:Row(
      children: [
        Expanded(
            child: Container(
              child: Text(
                "${item.ID } X ${item.Count}",
                style: OrderTextStyle,
              ),
            ),
            flex: 80,
        ),
        Expanded(
          child: Container(
            child: Text(
              cost.toString(),
              style: OrderTextStyle,
            ),
          ),
          flex: 20,
        ),
      ],
    ),
  );

  Widget _icon() =>Container(
    child: Image.asset('images/icon.png'),
  );

  Widget _billbotton() =>Container(
      width: MediaQuery.of(context).copyWith().size.width,
      child:ElevatedButton(
        onPressed: (){bill();},
        child: Text(
          "結帳",
          style:whiteTextStyle,
          maxLines: 1,
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          // shape: RoundedRectangleBorder(),
        ),
      )
  );

  void bill(){

    showordDialog("結帳成功","完成");

  }
  showordDialog(String s, String title) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(title),
            content: Text(
              s,
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyApp()));
                },
              ),
            ],
          );
        });

  }

}

