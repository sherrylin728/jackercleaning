import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jackercleaning/comfirm.dart';
import 'package:jackercleaning/constants.dart';
import 'package:jackercleaning/model/Item.dart';

void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: colorCustom,

      ),
      home: MyHomePage(title: '冷氣機清潔'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Item> item = [];
  @override
  void initState() {

    item.add(Item("分離式冷氣機(室內機)",2500));
    item.add(Item("分離式冷氣機(室內機+室外機)",3000));
    item.add(Item("窗型冷氣機(三噸以下)",3500));
    item.add(Item("窗型冷氣機(三噸以上)",4000));
    item.add(Item("吊隱式冷氣機(室內機)",3200));
    item.add(Item("吊隱式冷氣機(室內機+室外機)",3500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height*0.669;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,style: TextStyle(color: Colors.white)),

        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            _titleView(),
            _workerView(size),
            _nextbotton(),
          ],
        ),
      ),
    );
  }

  Widget _titleView() => Container(
    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
    child:Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
          width: 3,
          height: 26,
          color: colorCustom,
          child: Text(""),
        ),
        Container(
          alignment:Alignment.centerLeft,
          child: Text(
            "服務項目",
            style:LabelBlackTextStyle,
          ),
        ),
      ],
    ),
  );
  Widget _workerView(size) => Container(
    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
    margin:  EdgeInsets.fromLTRB(0, 0, 0, 30),
    height: size,
    child:Card(
      elevation: 2.0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: ListView.separated(
          itemCount: item.length,
          itemBuilder: (_, index) => ListTile(
            title: Text(item[index].ID),
            subtitle: Text("\$ ${item[index].Cost}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 22,
                  child:
                  IconButton(
                      color: colorCustom,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: new EdgeInsets.all(0.0),
                      onPressed: () {
                          if(item[index].Count>0){
                            setState(() {
                              item[index].Count--;
                            });
                          }
                      },
                      icon: const Icon(Icons.do_not_disturb_on)),
                ),
                Container(
                  width: 35,
                  child:
                  Text(
                    item[index].Count.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 22,
                  child:
                  IconButton(
                    color: colorCustom,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      padding: new EdgeInsets.all(0.0),
                      onPressed: () {
                        add(index);
                      },
                      icon: const Icon(Icons.add_circle)),
                ),
              ],
            ),
          ),
        separatorBuilder: (BuildContext context, index) {
          Divider divider;
            divider = Divider(
              thickness: 1,
              height: 0,
              color: Colors.black12,
            );
          return divider;
        },
      ),
    ),
  );
  Widget _nextbotton() =>Container(
      width: MediaQuery.of(context).copyWith().size.width,
      child:ElevatedButton(
        onPressed: (){next();},
        child: Text(
          "下一步",
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

  void next(){
    item.forEach((element) {
      if(element.Count>0){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Comfirm(element)));
      }
    });
  }

  void delect(int index){
    if(item[index].Count>0){
      setState(() {
        item[index].Count--;
      });
    }
  }

  void add(int index){
    if(item[index].Count == 10){
      showErrorDialog(context,"最多為10","錯誤");
      return;
    }
    for (var ls in item)  {
      if(ls.Count == 0){
        if(ls.ID == item[index].ID){
          setState(() {
            ls.Count++;
          });
          break;
        }
      }
      else if(ls.Count > 0){
        if(ls.ID != item[index].ID){
          showErrorDialog(context,"只能選擇單一個項目","錯誤");
          break;
        }
        else{
          setState(() {
            ls.Count++;
          });
          break;
        }
      }
    };
  }
}
showErrorDialog(BuildContext context, String s, String title) {
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });

}
Map<int, Color> color =
{
  50:Color.fromRGBO(54, 187, 217, .1),
  100:Color.fromRGBO(54, 187, 217, .2),
  200:Color.fromRGBO(54, 187, 217, .3),
  300:Color.fromRGBO(54, 187, 217, .4),
  400:Color.fromRGBO(54, 187, 217, .5),
  500:Color.fromRGBO(54, 187, 217, .6),
  600:Color.fromRGBO(54, 187, 217, .7),
  700:Color.fromRGBO(54, 187, 217, .8),
  800:Color.fromRGBO(54, 187, 217, .9),
  900:Color.fromRGBO(54, 187, 217, 1),
};
MaterialColor colorCustom = MaterialColor(0xff36bbd9, color);
