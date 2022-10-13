import 'package:flutter/material.dart';

class Wine {
  String price;
  String year;
  String title;
  String volume;
  String countryOfOrigin;
  String description;
  String imagePath;
  int rating;

  Wine(
      {required this.price,
      required this.title,
      required this.year,
      required this.volume,
      required this.countryOfOrigin,
      required this.description,
      required this.imagePath,
      required this.rating});
}

// List<String> images = [
//   "./wines/wine_1.png",
//   "./wines/wine_2.png",
//   "./wines/wine_3.png",
//   "./wines/wine_8.png",
//   "./wines/wine_9.png",
//   "./wines/wine_13.png",
//   "./wines/wine_14.png",
//   "./wines/wine_7.png",
//   "./wines/wine_6.png"
// ];

var wines = [
  Wine(
      price: '\$49',
      title: 'Bold Smooth Lush',
      year: "2019",
      volume: "500cl",
      description: 'Camofires + Grilled Cheese',
      imagePath: "./wines/wine_1.png",
      countryOfOrigin: 'France',
      rating: 5),
  Wine(
      price: '\$669',
      title: 'Bold Smooth Lush',
      year: "2020",
      volume: "500cl",
      description: 'Camofires + Grilled Cheese',
      imagePath: './wines/wine_2.png',
      countryOfOrigin: 'France',
      rating: 4),
  Wine(
      price: '\$669',
      title: 'Bold Smooth Lush',
      year: "1998",
      volume: "500cl",
      description: 'Camofires + Grilled Cheese',
      imagePath: "./wines/wine_3.png",
      countryOfOrigin: 'France',
      rating: 4),
  Wine(
      price: '\$49',
      title: 'Bold Smooth Lush',
      year: "2000",
      volume: "500cl",
      description: 'Camofires + Grilled Cheese',
      imagePath: "./wines/wine_8.png",
      countryOfOrigin: 'France',
      rating: 5),
  Wine(
      price: '\$49',
      title: 'Bold Smooth Lush',
      year: "2019",
      volume: "500cl",
      description: 'Camofires + Grilled Cheese',
      imagePath: "./wines/wine_9.png",
      countryOfOrigin: 'France',
      rating: 5),
  Wine(
      price: '\$49',
      title: 'Bold Smooth Lush',
      year: "2019",
      volume: "500 ml",
      description: 'Camofires + Grilled Cheese',
      imagePath: "./wines/wine_13.png",
      countryOfOrigin: 'France',
      rating: 2),
  Wine(
      price: '\$49',
      title: 'Bold Smooth Lush',
      year: "2019",
      volume: "500cl",
      description: 'Camofires + Grilled Cheese',
      imagePath: "./wines/wine_13.png",
      countryOfOrigin: 'France',
      rating: 5),
  Wine(
      price: '\$79',
      title: 'Bold Smooth Lush',
      year: "2019",
      volume: "500 ml",
      description: 'Camofires + Grilled Cheese',
      imagePath: "./wines/wine_7.png",
      countryOfOrigin: 'France',
      rating: 5),
  Wine(
      price: '\$100',
      title: 'Bold Smooth Lush',
      year: "2019",
      volume: "300cl",
      description: 'Camofires + Grilled Cheese',
      imagePath: "./wines/wine_6.png",
      countryOfOrigin: 'France',
      rating: 5),
];

var recommendedWines = [];
