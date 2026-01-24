// Creamos una clase singleton, es decir que solo tiene una instacia (static)
class DataSingleton {
  // Creamos la instacia de la clase, única
  static final _instancia = DataSingleton._constructor();

  // Creamos el constructor privado
  DataSingleton._constructor();

  // Creamos los atributos, se crean como atributos normales
  String nickname = "";

  /* Creamos el constructor que va a devolver la instacia (factory),
  * este no tiene porque crear una nueva instancia del objeto, que es
  * justo lo que queremos, tener una sola instacia, por eso lo utilizamos,
  * devolviendo la única instacia, se le pone al singleton el nombre de la
  * clase */
  factory DataSingleton() {
    // Devolvemos la instacia
    return _instancia;
  }
}
