// import 'dart:html';

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  String _name, _description, _category;
  int _relase_date;
  String _movie_image;
  double _price, _rating;

  MyCard(String name, String des, String category, int release_date,
      double price, double rating, String image) {
    this._name = name;
    this._description = des;
    this._category = category;
    this._relase_date = release_date;
    this._price = price;
    this._rating = rating;
    this._movie_image = image;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(0xFF, 0xEA, 0xF0, 0xF1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        // child: InkWell(
        //   onTap: () {},
        child: Column(
          children: [
            // Image.network(_movie_image) // Padding(
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(_movie_image)),
              ),
            ),

            Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  _name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  overflow: TextOverflow.clip,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(_description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.justify)),
            Padding(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
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
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                _rating.toString(),
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
                        padding: EdgeInsets.all(0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 5,
                          child: Column(
                            children: [
                              Icon(
                                Icons.theaters,
                                size: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  _category,
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
                        padding: EdgeInsets.all(0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 5,
                          child: Column(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  DateTime.fromMillisecondsSinceEpoch(
                                              _relase_date)
                                          .day
                                          .toString() +
                                      "\/" +
                                      DateTime.fromMillisecondsSinceEpoch(
                                              _relase_date)
                                          .month
                                          .toString() +
                                      "\/" +
                                      DateTime.fromMillisecondsSinceEpoch(
                                              _relase_date)
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          elevation: 5,
                          child: Column(
                            children: [
                              Icon(
                                Icons.money_outlined,
                                size: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  " ₹ " + _price.toString(),
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
                    )
                  ],
                )),

            // Container(
            //     padding: EdgeInsets.symmetric(vertical: 10),
            //     width: 200,
            //     child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: MaterialButton(
            //           enableFeedback: false,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10)),
            //           color: Colors.red,
            //           onPressed: () {},
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 "Price: ",
            //                 overflow: TextOverflow.clip,
            //                 style: TextStyle(
            //                     fontSize: 16,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.white),
            //               ),
            //               Text(
            //                 _price.toString() + " Rs/-",
            //                 overflow: TextOverflow.clip,
            //                 style: TextStyle(
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.white),
            //               ),
            //             ],
            //           ),
            //         ))),

            // Padding(
            //   padding: EdgeInsets.all(5),
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(10))),
            //     elevation: 5,
            //     child: Column(
            //       children: [
            //         Icon(
            //           Icons.money_outlined,
            //           size: 35,
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             " ₹ " + _price.toString(),
            //             overflow: TextOverflow.clip,
            //             style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.blue),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
        // ),
      ),
    );
  }
}
