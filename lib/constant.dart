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
