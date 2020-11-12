import 'package:flutter/material.dart';
import 'package:calendario_estatico/src/model/Cuadro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
 
class WidgetCuadro extends StatefulWidget {
  WidgetCuadro({Key key, this.item}) : super(key: key);
  final Cuadro item;

  @override
  _CuadroWidgetState createState() => _CuadroWidgetState();
}

class _CuadroWidgetState extends State<WidgetCuadro> {

  final controlador1 = TextEditingController();
  final controlador2 = TextEditingController();
  final controlador3 = TextEditingController();
  Color colorCambio;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Container(
            width: 70,
            height: 68,
            decoration: BoxDecoration(
              color: widget.item.color,
              border: new Border.all(
                color: Colors.black  
              )
            ),
            child: Column(
              children: [
                Text('${widget.item.t1}'),
                Expanded(
                  child: Container(
                    width: 0,
                    height: 0,
                  )
                ),
                Text('${widget.item.t2}'),
                Expanded(
                  child: Container(
                    width: 0,
                    height: 0,
                  )
                ),
                Text('${widget.item.t3}'),
              ],
            ),
          ),
          onTap: (){
            this.mostrarVentana(context);
            /*setState(() {
              widget.item.setTexto1 = "hola";
            });*/
          },
        )
      ],
    );
  }

  void mostrarVentana(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Text("Datos", style: TextStyle(fontSize: 20),),
              new TextField(
                controller: controlador1..text = widget.item.t1,
                decoration: new InputDecoration(
                  labelText: 'Asignatura', hintText: '',
                ),
              ),
              new TextField(
                controller: controlador2..text = widget.item.t2,
                decoration: new InputDecoration(
                  labelText: 'Profesor', hintText: ''
                ),
              ),
              new TextField(
                controller: controlador3..text = widget.item.t3,
                decoration: new InputDecoration(
                  labelText: 'Aula', hintText: ''
                ),
              ),

              Center(
                child: CircleColorPicker(
                  initialColor: widget.item.color,
                  onChanged: (color) => colorCambio = color,
                  size: const Size(240, 240),
                  strokeWidth: 4,
                  thumbSize: 36,
                ),
              ),
              
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 0,
                          height: 0,
                        )
                      ),
                      new FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                        ),
                        child: const Text('Cancelar'),
                        onPressed: () {
                          Navigator.pop(context);
                        }
                      ),
                      Expanded(
                        child: Container(
                          width: 0,
                          height: 0,
                        )
                      ),
                      new FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                        ),
                        child: const Text('Guardar'),
                        onPressed: () {
                          Navigator.pop(context);
                          if (colorCambio == null) {
                            colorCambio = Colors.white;
                          }
                          setState(() {
                            widget.item.setTexto1 = controlador1.text;
                            widget.item.setTexto2 = controlador2.text;
                            widget.item.setTexto3 = controlador3.text;
                            widget.item.setColor = colorCambio;
                            print(widget.item.color);
                          });
                        }
                      ),
                      Expanded(
                        child: Container(
                          width: 0,
                          height: 0,
                        )
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }

}