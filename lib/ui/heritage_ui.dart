import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../helpers/model.dart';
import '../helpers/models.dart';

class AyurvedaUI extends StatefulWidget {
  AyurvedaUI({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AyurvedaUIState createState() => _AyurvedaUIState();
}

class _AyurvedaUIState extends State<AyurvedaUI> {
  TextEditingController textCtrl = TextEditingController();
  List<Model> models = [];

  getList(String text) async {
    var list = await Models().getModels(text);
    setState(() {
      models = list;
    });
  }

  @override
  void initState() {
    getList("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          getHeader(),
          getBody(),
        ],
      ),
    );
  }

  getHeader() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
//                Flexible(
//                  flex: 5,
//                  child: Container(
//                    margin: EdgeInsets.only(left: 10.0),
//                    height: MediaQuery.of(context).size.height / 4.8,
//                    child: Align(
//                      alignment: Alignment.centerLeft,
//                      child: Image.asset("images/heritage.jpg"),
//                    ),
//                      ),
//                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Kerala ',
                          style: TextStyle(
                            fontSize: 37.0,
                            fontFamily: "Piedra",
                            color: Colors.teal.shade700,
                            letterSpacing: 1.0,
                            shadows: [
                              Shadow(
                                blurRadius: 2.0,
                                color: Colors.blueGrey,
                                offset: Offset(1.5, 1.0),
                              ),
                            ],
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Heritage',
                              style: TextStyle(
                                color: Colors.blue.shade800,
                                fontSize: 42.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "A complete natural beauty",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "Cookie",
                          color: Colors.brown.shade900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
              padding: EdgeInsets.only(left: 12.0),
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.brown.shade900, width: 2.0),
              ),
              child: TextField(
                controller: textCtrl,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Search here to know more",
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
//                      print('search');
                    },
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  if (text.isEmpty) {
                    getList("");
                  } else {
                    getList(text);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getBody() {
    return Stack(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.brown.shade50,
                spreadRadius: 1.0,
                offset: Offset(0.0, -2.0),
              ),
            ],
          ),
          child: Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.brown.shade50,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 180,
          child: ScrollConfiguration(
            behavior: ScrollBehavior()
              ..buildViewportChrome(context, null, AxisDirection.down),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  getCards(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  getCards() {
    return models.length == 0
        ? Center(
            child: Text("Sorry, No result found"),
          )
        : ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: models.length,
            itemBuilder: (context, int i) {
              double userRating = 1;
              double sum = 0;
              for (var o in models[i].ratings) {
                sum += o;
              }
              userRating = sum / models[i].ratings.length;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                width: double.infinity,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: models[i].align,
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            child: Image.asset(
                              models[i].imgPath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Align(
                          alignment: models[i].align == Alignment.topLeft
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  models[i].title,
                                  style: TextStyle(
                                    fontFamily: "Lobster",
                                    fontSize: 30.0,
                                    color: models[i].color,
                                  ),
                                ),
                                RatingBarIndicator(
                                  rating: userRating,
                                  direction: Axis.horizontal,
                                  unratedColor: Colors.brown.shade100,
                                  itemCount: 5,
                                  itemSize: 18,
//                                  itemPadding:
//                                      EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        models[i].description,
                        style: TextStyle(
                          fontFamily: "Cookie",
                          fontSize: 18.0,
                          color: Colors.brown.shade900,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
  }
}
