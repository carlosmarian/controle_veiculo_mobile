import 'package:moor_flutter/moor_flutter.dart';

import '../my_database.dart';

part 'VeiculoDAO.g.dart';

//Classe para join
class VeiculoWithCompleto{
  final Veiculo veiculo;
 
  VeiculoWithCompleto(this.veiculo) ;
}

@UseDao(tables: [Veiculos])
class VeiculoDAO extends DatabaseAccessor<MyDatabase> with _$VeiculoDAOMixin{

  VeiculoDAO(MyDatabase db): super (db);

  Stream<List<VeiculoWithCompleto>> listaAll(){
  // Wrap the whole select statement in parenthesis
    return (select(veiculos)
          // Statements like orderBy and where return void => the need to use a cascading ".." operator
          ..orderBy(
            ([
              // Primary sorting by due date
              (t) =>
                  OrderingTerm(expression: t.placa, mode: OrderingMode.asc),
            ]),
          ))/*
        // As opposed to orderBy or where, join returns a value. This is what we want to watch/get.
        .join(
          [
            // Join all the produtos with their tags.
            // It's important that we use equalsExp and not just equals.
            // This way, we can join using all tag names in the produtos table, not just a specific one.
            leftOuterJoin(categorias, categorias.id.equalsExp(produtos.idCategoria)),
          ],
        )*/
        // watch the whole select statement including the join
        .watch()
        // Watching a join gets us a Stream of List<TypedResult>
        // Mapping each List<TypedResult> emitted by the Stream to a List<TaskWithTag>
        .map(
          (rows) => rows.map(
            (row) {
              return VeiculoWithCompleto(
                row.readTable(veiculo),
              );
            },
          ).toList(),
        );
  }

  Future addVeiculo(Veiculo entity){
    return into(veiculos).insert(entity);
  }  

  Future deleteVeiculo(id){
    return (delete(veiculos)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future updateVeiculo(Veiculo entity){
    return update(veiculos).replace(entity);
  }
}
