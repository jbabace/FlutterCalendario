import 'package:flutter/material.dart';

import 'package:calendario_estatico/src/model/Cuadro.dart';
import 'package:calendario_estatico/src/model/CuadroRecreo.dart';
import 'package:calendario_estatico/src/model/CuadroHora.dart';
import 'package:calendario_estatico/src/model/CuadroDia.dart';

import 'package:calendario_estatico/src/widget/CuadrosRecreos.dart';
import 'package:calendario_estatico/src/widget/CuadrosCalendario.dart';
import 'package:calendario_estatico/src/widget/CuadrosHoras.dart';
import 'package:calendario_estatico/src/widget/CuadrosDias.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  
  var horas = ["8:00", "8:55", "9:50", "10:45", "11:40", "12:05", "13:00", "13:55", "14:50"];
  var dias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes"];
  var data = [
    //8:00 - 8:55
    Cuadro("", "", "", Colors.white), 
    Cuadro("", "", "", Colors.white), 
    Cuadro("", "", "", Colors.white), 
    Cuadro("PM", "Santi", "104", Colors.blue),
    Cuadro("SGE", "Aritz", "104", Colors.green),
    //8:55 - 9:50
    Cuadro("", "", "", Colors.white),
    Cuadro("PS", "Beñat", "104", Colors.orange[700]),
    Cuadro("DI", "Martin", "104", Colors.red),
    Cuadro("PM", "Santi", "104", Colors.blue),
    Cuadro("SGE", "Aritz", "104", Colors.green),
    //9:50 - 10:45
    Cuadro("AD", "Miren", "104", Colors.pink[400]),
    Cuadro("PS", "Beñat", "104", Colors.orange[700]),
    Cuadro("DI", "Martin", "104", Colors.red),
    Cuadro("DI", "Martin", "104", Colors.red),
    Cuadro("PM", "Santi", "104", Colors.blue),
    //10:45 - 11:40
    Cuadro("AD", "Miren", "104", Colors.pink[400]),
    Cuadro("AD", "Miren", "104", Colors.pink[400]),
    Cuadro("PS", "Beñat", "104", Colors.orange[700]),
    Cuadro("SGE", "Aritz", "104", Colors.green),
    Cuadro("PM", "Santi", "104", Colors.blue),
    //11:40 - 12:05
    Cuadro("", "RECREO", "", Colors.grey),
    Cuadro("", "RECREO", "", Colors.grey),
    Cuadro("", "RECREO", "", Colors.grey),
    Cuadro("", "RECREO", "", Colors.grey),
    Cuadro("", "RECREO", "", Colors.grey),
    //12:05 - 13:00
    Cuadro("PM", "Santi", "104", Colors.blue),
    Cuadro("AD", "Miren", "104", Colors.pink[400]),
    Cuadro("PS", "Beñat", "104", Colors.orange[700]),
    Cuadro("AD", "Miren", "104", Colors.pink[400]),
    Cuadro("DI", "Martin", "104", Colors.red),
    //13:00 - 13:55
    Cuadro("DI", "Martin", "104", Colors.red),
    Cuadro("", "", "", Colors.white),
    Cuadro("SGE", "Aritz", "104", Colors.green),
    Cuadro("AD", "Miren", "104", Colors.pink[400]),
    Cuadro("DI", "Martin", "104", Colors.red),
    //13:55 - 14:50
    Cuadro("DI", "Martin", "104", Colors.red),
    Cuadro("", "", "", Colors.white),
    Cuadro("SGE", "Aritz", "104", Colors.green),
    Cuadro("", "", "", Colors.white),
    Cuadro("", "", "", Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CALENDARIO'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(5),
              },
              //border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Column(children: [
                      Container() // este hueco estara vacio siempre
                    ]),
                    Column(
                      children: [
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(5, (index) {
                              return WidgetCuadroDia(item: new CuadroDia(dias[index]));
                            }),
                          ),
                        )
                      ],
                    )
                  ]
                ),
                TableRow(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 1,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(8, (index) {
                              var i = index + 1;
                              return WidgetCuadroHora(item: new CuadroHora(horas[index], horas[i]));
                            }),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(40, (index) {
                              if (index >= 20 && index <=24) {
                                return WidgetCuadroRecreo(item: new CuadroRecreo());
                              } else{
                                return WidgetCuadro(item: data[index]);
                              }
                            }),
                          ),
                        )
                        
                      ]
                    )
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}