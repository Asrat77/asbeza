import 'package:asbeza/models/asbeza.dart';

import 'db_connect.dart';
import 'db_support.dart';

class Service {
  Repo? _repo;

  Service(){
    _repo=Repo();
  }

  saveItems(Asbeza asbeza) async {
    return await _repo!.insertData("asbeza", asbeza.toJson());
  }

  readItems() async {
    return await _repo!.readData("asbeza");
  }

  updateItems(Asbeza asbeza) async {

    return await _repo!.updateData("asbeza", asbeza.toJson());
  }

  deleteItems(id) async {
    return await _repo!.deleteData("asbeza", id);
  }

}