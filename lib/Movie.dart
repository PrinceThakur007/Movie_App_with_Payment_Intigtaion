import 'package:flutter/widgets.dart';

class Movie {
  String _name, _description, _category;
  int _relase_date;
  String _movie_image;
  double _price, _rating;

  Movie(
      {@required String name,
      @required String description,
      @required String caegory,
      @required int release_date,
      @required double price,
      @required double rating,
      @required String movie_image}) {
    this._name = name;
    this._description = description;
    this._category = caegory;
    this._relase_date = release_date;
    this._price = price;
    this._rating = rating;
    this._movie_image = movie_image;
  }

  String getName() {
    return _name;
  }

  String getDescription() {
    return _description;
  }

  String getCategory() {
    return _category;
  }

  int getReleaseDate() {
    return _relase_date;
  }

  double getPrice() {
    return _price;
  }

  double getRating() {
    return _rating;
  }

  String getImage() {
    return _movie_image;
  }
}
