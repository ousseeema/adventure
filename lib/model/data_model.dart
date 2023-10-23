// ignore: camel_case_types
class datamodel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  datamodel(
      {required this.name,
      required this.img,
      required this.price,
      required this.people,
      required this.stars,
      required this.description,
      required this.location});

      factory datamodel.fromJson(Map<String,dynamic> json){
        return datamodel(name: json["name"], 
        img: json["img"],
         price: json["price"], 
         people: json["people"],
          stars: json["stars"], 
          description: json["description"], 
          location: json["location"]);
      }
}
