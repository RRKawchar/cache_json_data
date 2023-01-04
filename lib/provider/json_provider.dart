import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiProvider {
  final url = "https://jsonplaceholder.typicode.com/comments";

  Future getData() async {
    String fileName = "PathString.json";
    var dir = await getTemporaryDirectory();
    File file = File(dir.path + "/" + fileName);
     if(file.existsSync()){
       print("Reading from device cache");

       final data= file.readAsStringSync();
       final res=json.decode(data);

       return res;
     }else{
       print("Fetch from the network");
       final req = await http.get(Uri.parse(url));
       if(req.statusCode==200){

         final body= req.body;
         /// save to json catch
         file.writeAsStringSync(body,flush: true,mode: FileMode.write);
         final res= json.decode(body);
         print(res);
         return res;
       }else{
         return json.decode(req.body);
       }
     }


  }
}
