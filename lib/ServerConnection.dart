import 'package:mongo_dart/mongo_dart.dart';

main(List<String> arguments) async {
  Db db = Db('mongodb://localhost:27017/mongo_markers');
  await db.open();

  print('Connected to database');

  DbCollection coll = db.collection('markers');

  var markers = await coll.find().toList();
  print(markers);

  await db.close();
}
