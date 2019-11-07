import 'package:mongo_dart/mongo_dart.dart';

main(List<String> arguments) async {
  Db db = Db('mongodb://localhost:27017/mongo_markers');
  await db.open();

  print('Connected to database');

  DbCollection coll = db.collection('markers');

  // List markers
  var markers = await coll.find().toList();
  print(markers);

  // Create markers
  /*await coll.save({
    "id": 2,
    "LatLng": "35.23, -101.87"
  });
  print('Marker saved!');

  // Update markers
  await coll.update(await coll.findOne(where.eq('id', 2)), {
    r'$set': {
      'LatLng': '35.20, -101.89'
    }
  });
  print('Updated person: ');
  print(await coll.findOne(where.eq('id', 2)));

  // Delete markers
  await coll.remove(await coll.findOne(where.eq('id', 2)));
  print(await coll.findOne(where.eq('id', 2)));*/

  await db.close();
}
