import 'package:flutter/foundation.dart' show kIsWeb;
//En environnement de dev, en local, flutter web
class API{
  String mode = "dev";
  String port = "3000";

  String getBaseURL(){
    String url = "";

    switch(mode){
      case "dev":{
        if(kIsWeb){
          url = "http://localhost:"+port;
        }
        else{
          url = "http://10.0.2.2:3000"+port;
        }
      }
      break;
      case "prod":{
          url = "https://apiressourcesrel.herokuapp.com";
      }
      break;
    }
    return url;
  }


}