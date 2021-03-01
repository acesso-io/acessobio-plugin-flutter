

class ErrorBio {

  String code = null;
  String method = null;
  String description = null;

  ErrorBio(Map<dynamic, dynamic> map){

    for(String nome in map.keys){
      if(nome == "code"){
        code = map[nome];
      }else if(nome == "method"){
        method = map[nome];
      }else if(nome == "description"){
        description = map[nome];
      }
    }

  }


}