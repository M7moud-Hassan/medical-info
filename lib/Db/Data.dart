import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Data {
  var db;

  Future<void> inti() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'info_teby.db');

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join("assets", "DB/info_teby.db"));

      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

      await new File(path).writeAsBytes(bytes);
    }

    db = await openDatabase(path);
  }

  Future<List<Map>> readData() async {
    return  await db.rawQuery('select * from quote');
  }


  Future<List<Map>> getAll_dep() async {
    return  await db.rawQuery('select * from fav_dep');
  }
  Future<List<Map>>readFav(id_dep)async{
    if(id_dep==1)
    return await db.rawQuery('select _id,qte,fav_dep.name,fav_dep.id from quote,fav,fav_dep where quote._id=fav.id and fav.id_dep=fav_dep.id');
    else   return await db.rawQuery('select _id,qte,fav_dep.name,fav_dep.id  from quote,fav,fav_dep where quote._id=fav.id and fav.id_dep=fav_dep.id and fav.id_dep=$id_dep');
  }

  Future<void> updateDep(id_dep,name) async {
      await db.rawUpdate("update fav_dep set name='$name' where id=$id_dep");
  }

  update_fav_part(id_part,id,id_exit)async{
    await db.rawUpdate("update fav set id_dep=$id_part where id=$id and id_dep=$id_exit");
  }
  deleteFav(id,id_dep)async{
    await db.delete("fav",where:"id_dep=$id_dep and id=$id");
  }

  Future<void> deleteDep(id_dep) async {
      await db.delete("fav", where: "id_dep=$id_dep");
      await db.delete("fav_dep", where: "id=$id_dep");
  }

  Future<List<Map>> getResume() async{
    return  await db.rawQuery('select id from resum');
  }

  updateResume(id) async {
      await db.rawUpdate("update resum set id='$id'");
  }
  add_fav_dep(name)async{
    await db.rawInsert("insert into fav_dep('name') values('$name')");
  }

  add_fav(id,id_dep)async{
    await db.rawInsert("insert into fav values('$id_dep','$id')");
  }
  Future<List<Map>> getAllFav() async{
    return  await db.rawQuery('select id from fav');
  }
  deleteAll() async{
    await db.delete("fav",where:"id is not null");
    await db.delete("fav_dep",where:"id!=1");
  }
}
