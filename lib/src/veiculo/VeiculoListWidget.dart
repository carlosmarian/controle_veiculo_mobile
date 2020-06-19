import 'package:controle_veiculo_mobile/src/db/dao/VeiculoDAO.dart';
import 'package:controle_veiculo_mobile/src/db/my_database.dart';
import 'package:flutter/material.dart';

class VeiculoListWidget extends StatefulWidget {
  @override
  _VeiculoListWidgetState createState() => _VeiculoListWidgetState();
}

class _VeiculoListWidgetState extends State<VeiculoListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Veiculos"),
        ),
        body: StreamBuilder<List<VeiculoWithCompleto>>(
            stream: MyDatabase.instance.veiculoDAO.listaAll(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Container();

              List<VeiculoWithCompleto> veiculos = snapshot.data;

              return ListView.builder(
                itemCount: veiculos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(veiculos[index].veiculo.placa),
                          subtitle: Text("Vazio"),
                        ),
                        Row(
                          children: <Widget>[
                            Text("22"),
                            Spacer(),
                            IconButton(
                                icon: Icon(Icons.directions_bike),
                                onPressed: () {
                                  print("object");
                                }),
                            IconButton(
                                icon: Icon(Icons.delete_sweep),
                                onPressed: () {
                                  print("object");
                                })
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }));
  }
}
