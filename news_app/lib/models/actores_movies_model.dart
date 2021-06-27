
/**
 * 
 * Clase Actores que recolecta todos loa actores de la peliculas
 * a traves de una lista list. 
 * 
 * 
 * se crea un metodo con un for para pedir los actores y rellenarlos
 * 
 */
class Actores{

  // coleccion de actores
  List<Actor> actoresMovie  = new List();

  Actores.fromJsonList ( List<dynamic> jsonlist){

    if(jsonlist == null ) return;

    jsonlist.forEach((element) {
      final actor = Actor.fromJsonMap(element);
      actoresMovie.add(actor);
    });

  }

}


/**
 * 
 * clase actor creada con el pasteJsoncode 
 * a traves del rowdata del json de la api 
 * 
 * crea todos los atributos y luego creo un metodo que mapea el json a sus 
 * respectivos atributos. 
 * map( string , dynamic)
 */

class Actor {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  String department;
  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  Actor.fromJsonMap( Map<String , dynamic> json ){

    adult = json['adult'];
    gender = json['gender'];
    id  = json['id'];
    knownForDepartment  = json['known_for_department'];
    name  = json['name'];
    originalName  = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId  = json['cast_id'];
    character  = json['character'];
    creditId  = json['credit_id'];
    order  = json['order'];
    department  = json['department'];
    job = json['job'];

  }


/** 
 * se trea la imagen del poster del actor para setearlo a su atributo
*/
  getPosterImgProfileActor() {
    if (profilePath == null) {
      return 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
   



}
