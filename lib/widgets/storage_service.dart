import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  //Vindt alle filenames in storage folder
  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('Kunstwerk').listAll(); //check Kunstwerk folder

    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file; $ref');
    });
    return results;
  }
  //downloadURL zoekt voor een file in Firebase Storage via filename
  Future<String> downloadURL(String imageName) async{
    String downloadURL = await storage.ref('Kunstwerk/$imageName').getDownloadURL(); //ref geeft aan om in Kunstwerk folder te zoeken

    return downloadURL;
  }
}