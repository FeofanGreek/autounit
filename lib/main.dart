import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'barScan.dart';

String codeText;
final List<String> codesList = [];

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: mainScreen()));

}
var _controllerSearchCode = TextEditingController(text: codeText);


class mainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),

      appBar:AppBar(
        elevation: 0.0,
        //title: Image.asset('images/mainLogo.png',  height: 50, fit:BoxFit.fill),
        title:Text('Сканируйте штрихкод'),
        centerTitle: true,
        backgroundColor: Color(0xFFffffff),
        brightness: Brightness.light,
        leading: Container(
          child: Material(
            color: Colors.white, // button color
            child: InkWell(
              splashColor: Colors.green, // splash color
              onTap: () {}, // button pressed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.playlist_add_check, size: 18.0, color: Colors.black), // icon
                  Text("Orders", style: TextStyle(color: Colors.black87)), // text
                ],
              ),
            ),
          ),
        ),
      ),
      body:
        SingleChildScrollView(
        physics: ScrollPhysics(),
          child:Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10,10,10,30),
                child:TextFormField(
                  enabled: true,
                  //inputFormatters: [maskFormatterPhone],
                  //keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Код детали",
                    /*prefixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) => QRViewExample()));
                      },
                      icon: Icon(Icons.qr_code_scanner),
                    ),*/
                    suffixIcon:
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end, // added line
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                          IconButton(
                          onPressed: () {
                              Navigator.push(context,
                              CupertinoPageRoute(builder: (context) => QRViewExample()));
                              },
                            icon: Icon(Icons.qr_code_scanner),
                          ),
                          IconButton(
                          onPressed: () => _controllerSearchCode.clear(),
                          icon: Icon(Icons.clear),
                        ),
                            IconButton(
                              onPressed: () => _controllerSearchCode.clear(),
                              icon: Icon(Icons.search),
                            ),
                      ]),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ), enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),),

                  /*validator: (value) {
                  if (value.isEmpty) {
                    return 'Συμπληρώστε την ενότητα Κινητό τηλέφωνο';
                  }
                  return null;
                      },*/
                  onChanged: (value){
                    /*if((value.length>16) & (value.length<19)){
                      //функция поиска без опций администрирования
                      searchStaff(value);
                    }*/
                  },
                  // ignore: deprecated_member_use
                  autovalidate: true,
                  controller: _controllerSearchCode,
                ),

              ),
                      ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: codesList.length,
                  itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Column(
                                children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(50,0,10,5),
                                      alignment: Alignment(-1.0, 0.0),
                                        child:Text('${codesList[index]}', style: TextStyle(fontSize: 20.0,color: Colors.black87,fontWeight: FontWeight.bold,))),
    ]));}),

            ],
          ),
        )
    );
  }
}

@override
void textFieldText() {
  if (result != null) {
    _controllerSearchCode.text = codeText;
    codesList.add(codeText);
  }
}