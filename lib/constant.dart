import 'package:flutter/material.dart';

import 'models/category.dart';

enum Complexity { simple, challenging, hard }

enum Affordability { affordable, pricey, luxurious }

String getComplexity(Complexity complexity) {
  switch (complexity) {
    case Complexity.simple:
      return "Simple";
    case Complexity.challenging:
      return "Challenging";
    case Complexity.hard:
      return "Hard";
  }
}

String getAffordability(Affordability affordability) {
  switch (affordability) {
    case Affordability.affordable:
      return "Affordable";
    case Affordability.pricey:
      return "Pricey";
    case Affordability.luxurious:
      return "Luxurious";
  }
}

const demoCategories = [
  Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'German',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Exotic',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Asian',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'French',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Summer',
    color: Colors.teal,
  ),
];
