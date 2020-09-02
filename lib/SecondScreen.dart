import 'package:flutter/material.dart';
import 'package:the_movie/Movie.dart';
import 'package:the_movie/Services/PaymentService.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SecondScreen extends StatefulWidget {
  Movie obj2;
  SecondScreen({@required Movie obj}) {
    this.obj2 = obj;
  }

  @override
  _SecondScreenState createState() => _SecondScreenState(obj: obj2);
}

class _SecondScreenState extends State<SecondScreen> {
  Movie obj3;
  double price_value;
  _SecondScreenState({@required Movie obj}) {
    this.obj3 = obj;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    price_value = obj3.getPrice() * 100;
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie on demand"),
        backgroundColor: Color.fromARGB(0XFF, 0x33, 0x35, 0x45),
      ),
      body: Builder(
        builder: (context) => Container(
          color: Color.fromARGB(0XFF, 0x33, 0x35, 0x45),
          child: ListView(
            children: [
              Card(
                color: Color.fromARGB(0XFF, 0x33, 0x35, 0x45),
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                elevation: 5,
                // child: InkWell(
                //   onTap: () {},
                child: Column(
                  children: [
                    // Image.network(_movie_image) // Padding(
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 280,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(obj3.getImage())),
                      ),
                    ),

                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          obj3.getName(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                          overflow: TextOverflow.clip,
                        )),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Text(obj3.getDescription(),
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.justify)),
                    Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                elevation: 5,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.star_border,
                                      size: 35,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        obj3.getRating().toString(),
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.theaters,
                                        size: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          obj3.getCategory(),
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          DateTime.fromMillisecondsSinceEpoch(
                                                      obj3.getReleaseDate())
                                                  .day
                                                  .toString() +
                                              "\/" +
                                              DateTime.fromMillisecondsSinceEpoch(
                                                      obj3.getReleaseDate())
                                                  .month
                                                  .toString() +
                                              "\/" +
                                              DateTime.fromMillisecondsSinceEpoch(
                                                      obj3.getReleaseDate())
                                                  .year
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),

                    Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: 200,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.red,
                              onPressed: () async {
                                print(price_value.toString() +
                                    "---------------------------");
                                String data = price_value.toString();
                                ProgressDialog dialog =
                                    new ProgressDialog(context);
                                dialog.style(message: 'Please wait...');
                                await dialog.show();
                                var response =
                                    await StripeService.payWithNewCard(
                                        amount: '1000' + '00', currency: 'INR');
                                await dialog.hide();
                                // if (response.success == true) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(response.message),
                                  duration: new Duration(
                                      milliseconds: response.success == true
                                          ? 1200
                                          : 3000),
                                ));
                                // }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Buy Now ",
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    " ₹ " + obj3.getPrice().toString(),
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ))),
                  ],
                ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
