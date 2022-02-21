import 'package:flutter/material.dart';
import 'package:sliceapp/slice_theme.dart';
import 'package:sliceapp/components/globals/cardsMenu.dart';
// ignore: unused_import
import 'package:sliceapp/components/globals/customClickableTile.dart';

class MRecetteScreen extends StatefulWidget {
  
  const MRecetteScreen({ Key? key}): super(key: key);
  @override
  State<StatefulWidget> createState() => _MRecetteScreenState(); 
}

class _MRecetteScreenState extends State<MRecetteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              // margin: const EdgeInsets.only(top: 25),  
              child : Stack(
                children: <Widget>[
                  Image.asset('lib/assets/images/header_home.png'),
                  Container(
                    margin: const EdgeInsets.only(top: 25),  
                    child : Center( child :Text('Mega Recette',
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    )
                    )
                  )
                ]
              )
            )
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 0, bottom: 10),              
              child:
                Center(
                  child: Text('La belle Mega recette',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,      
                )
              )
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: 
              Center(
                child: Text('Les courses sont faites, nous passons en cuisine. Sortez votre plus beau tablier, ça va chauffer !',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              )
            )
          ),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (gridElementWidth / gridElementHeight),
            physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,    
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 16.0),           
            children: [  
              CardsMenu(
                icon: "lib/assets/images/knife.png",
                greyTitle: "Recettes",
                mainSubtitle: "6",
                subtitle: "recettes"
              ),
              CardsMenu(
                icon: "lib/assets/images/plate.png",
                greyTitle: "Portions",
                mainSubtitle: "4",
                subtitle: "pers."
              ),
              CardsMenu(
                icon: "lib/assets/images/chrono.png",
                greyTitle: "Préparation",
                mainSubtitle: "2",
                subtitle: "h"
              ),
              CardsMenu(
                icon: "lib/assets/images/star.png",
                greyTitle: "Gain de temps",
                mainSubtitle: "4",
                subtitle: "h",
              )  
            ], 
          ),
          Container(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 15),
            child: Center(
              child: Text('* Durée estimée en fonction du temps de préparation calculé par notre algorithme. ',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
              )
            )
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: ElevatedButton(             
                onPressed: () {            
                } ,
                child: const Text('Lancer la Mega Recette ->'),
                style: ElevatedButton.styleFrom(                
                  primary: PrimaryColor,
                  shape: StadiumBorder(),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                    color: Colors.white
                  )
                ),
              ),
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            margin: const EdgeInsets.only(bottom: 30, top: 20),
            child: Container(              
              padding: const EdgeInsets.only(left:15, right:15, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF1F1D9), 
                    spreadRadius: 0,
                    blurRadius: 24, 
                    offset: Offset(0, 20)
                  ),
                ],
              ),
              child: SizedBox(
                height: 420,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text('Allergies',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.left, 
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text('4 allergènes détectés',
                        style: ListViewStyle.headline1(context),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text('Ce Menu contient 4 allergènes connus de nos chefs. Si vous avez un doute, n’hésitez pas à nous contacter et à vous arrêter pendant la préparation.',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,                    
                    ),
                    ),
                    Expanded(
                      child: ListView( 
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/nuts.png'),
                                    title: Text('Arachides'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/cereal.png'),
                                    title: Text('Gluten'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/egg.png'),
                                    title: Text('Oeufs'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/milk.png'),
                                    title: Text('Lactose'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            margin: const EdgeInsets.only(bottom: 30),
            child: Container(              
              padding: const EdgeInsets.only(left:15, right:15, top: 10, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF1F1D9), 
                    spreadRadius: 0,
                    blurRadius: 24, 
                    offset: Offset(0, 20)
                  ),
                ],
              ),
              child: SizedBox(
                height: 560,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text('Ustensiles',
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.left, 
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text('6 ustensiles nécessaires',
                        style: ListViewStyle.headline1(context),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text('Nous vous listons les ustentiles qui pour nous sont indispensables à la réalisation du Menu, mais vous pouvez utiliser ce que vous voulez !',
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.left,                    
                    ),
                    ),
                    Expanded(
                      child: ListView( 
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/poele.png'),
                                    title: Text('Poêle(s)'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/casserole.png'),
                                    title: Text('Casseroles'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/four.png'),
                                    title: Text('Four'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/planche.png'),
                                    title: Text('Planche(s)'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/cuilliere.png'),
                                    title: Text('Cuillière(s)'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Card(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xFFC6C5B2), 
                                        spreadRadius: 0, 
                                        offset: Offset(0, 1)
                                      ),
                                    ],
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.yellow[50],
                                    leading: Image.asset('lib/assets/images/fouet.png'),
                                    title: Text('Fouet(s)'),
                                  ),
                                ), 
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            )
          ),
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 15),
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: ElevatedButton(             
                onPressed: () {            
                } ,
                child: const Text('Supprimer la Mega Recette'),
                style: ElevatedButton.styleFrom(                
                  primary: Colors.red,
                  shape: StadiumBorder(),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                    color: Colors.white
                  )
                ),
              ),
            )
          ),
        ],
      )
    );
  }
}