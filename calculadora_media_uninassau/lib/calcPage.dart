import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String av1;
  String colegiada;
  double media = 0;
  String status = "Aguardando";

  void pegarValores() {
    setState(() {
      av1 = myController.text;
      colegiada = myControllerColegiada.text;

      double converteAv1 = double.tryParse(av1);
      double converteColegiada = double.tryParse(colegiada);
      media = (converteAv1 + converteColegiada) / 2;

      if (media >= 7) {
        status = "Aprovado";
      } else if (media <= 6) {
        if (media <= 2.99) {
          status = "Reprovado";
        } else {
          status = "Recuperação";
        }
      }

      //Limpa os campos após concluir o cálculo da nota
      myController.clear();
      myControllerColegiada.clear();
    });
  }

  //Controller para recuperar valores
  final myController = TextEditingController();
  final myControllerColegiada = TextEditingController();
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 160, left: 20, right: 20, bottom: 10),
        child: Container(
          color: Colors.yellow,
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          width: 500,
          height: 350,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // autofocus: true,
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Nota Av1",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                // autofocus: true,
                keyboardType: TextInputType.number,
                controller: myControllerColegiada,
                decoration: InputDecoration(
                  labelText: "Nota colegiada",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Média = $media',
                style: Theme.of(context).textTheme.headline4,

                //style: TextStyle(color: Colors.black),
                //style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Status: $status',
                style: Theme.of(context).textTheme.headline6,

                //style: TextStyle(fontSize: 25),
              ),
              Container(
                height: 12,
                alignment: Alignment.centerRight,
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  //color: Color(0xFF3C5A99),
                  color: Colors.green,

                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          textColor: Colors.white,
                          splashColor: Colors.blueAccent,
                          child: Text(
                            'Calcular média geral',
                            style: TextStyle(fontSize: 23),
                            textAlign: TextAlign.right,
                          ),
                          onPressed: pegarValores,
                        ),
                        Container(
                          child: SizedBox(
                            height: 28,
                            width: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
