import 'package:flutter/foundation.dart' show kIsWeb;
//En environnement de dev, en local, flutter web
String mode = "dev";
String port = "3000";

class API{


  static String getBaseURL(){
    String url = "";

    switch(mode){
      case "dev":{
        if(kIsWeb){
          url = "http://localhost:"+port;
        }
        else{
          url = "http://10.0.2.2:"+port;
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

  static String getUrlWithRoute(String route){
    print(mode);
    print(getBaseURL());
    return getBaseURL()+"/"+route;
  }


}