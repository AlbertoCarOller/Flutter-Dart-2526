/// Esta clase encapsula todos los datos existentes para un Avatar
/// Se puede añadir más funcionalidad para facilitar, por ejemplo un 
/// nuevo constructor que cree un objeto pasando los datos de un avatar (map)
/// de rawData
class Avatar {
  int? id;
  String? firstName;
  String? lastName;
  int? age;
  String? jobTitle;  
  String? image;

  Avatar({this.id, this.firstName, this.lastName, this.age, this.jobTitle, this.image});
}
