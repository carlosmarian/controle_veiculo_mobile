import 'package:moor_flutter/moor_flutter.dart';

import 'dao/VeiculoDAO.dart';

part 'my_database.g.dart';

class Veiculos extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get placa => text()();
}


@UseMoor(tables: [Veiculos])
class MyDatabase  extends _$MyDatabase{
  //O _$Mydatabase foi criado pelo build_runner, comando
  // flutter packages pub run build_runner build

  static MyDatabase instance = MyDatabase._internal();

  VeiculoDAO veiculoDAO;

  //MyDatabase(): super(FlutterQueryExecutor.inDatabaseFolder(path: 'db1.sqlite'));
  MyDatabase._internal(): super(FlutterQueryExecutor.inDatabaseFolder(path: 'db1.sqlite')){    
   veiculoDAO = VeiculoDAO(this);
  }

  @override
  int get schemaVersion => 1;

}