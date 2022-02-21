import 'package:flutter/material.dart';
import 'package:sliceapp/slice_theme.dart';
import 'package:sliceapp/components/globals/cardsMenu.dart';
import 'package:sliceapp/components/globals/pageTitle.dart';
import 'package:sliceapp/components/globals/mainSliceTitle.dart';
import 'package:sliceapp/components/globals/pageDescription.dart';
import 'package:sliceapp/components/globals/mainButton.dart';
import 'package:sliceapp/components/globals/asterixDescription.dart';
import 'package:sliceapp/components/globals/stickyButton.dart';

import 'package:sliceapp/components/allergene.dart';
import 'package:sliceapp/components/ustensiles.dart';
import 'package:sliceapp/components/plat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          PageTitle(
              pageTitle: "Accueil",
              headerImg: 'lib/assets/images/header_home.png'),
          MainTitle(title: "Menu de la semaine"),
          PageDescription(
              description:
                  "Les légumes du Printemps sont là, ça sent le soleil dans les assiettes !"),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (gridElementWidth / gridElementHeight),
            physics:
                NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 16.0),
            children: [
              CardsMenu(
                  icon: "lib/assets/images/knife.png",
                  greyTitle: "Recettes",
                  mainSubtitle: "6",
                  subtitle: "recettes"),
              CardsMenu(
                  icon: "lib/assets/images/plate.png",
                  greyTitle: "Portions",
                  mainSubtitle: "4",
                  subtitle: "pers."),
              CardsMenu(
                  icon: "lib/assets/images/chrono.png",
                  greyTitle: "Préparation",
                  mainSubtitle: "2",
                  subtitle: "h"),
              CardsMenu(
                icon: "lib/assets/images/star.png",
                greyTitle: "Gain de temps",
                mainSubtitle: "4",
                subtitle: "h",
              )
            ],
          ),
          MainButton(
              buttonText: "Faire ce menu cette semaine ->",
              route: MenuScreenState())
        ],
      ),
    );
  }
}

class MenuScreenState extends StatefulWidget {
  const MenuScreenState({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreenState> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: ListView(children: <Widget>[
          SizedBox(
            height: 40,
          ),
          MainTitle(title: "Menu de la semaine"),
          PageDescription(
              description:
                  "Les légumes de printemps sont là, ça sent le soleil dans les assiettes ! "),
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (gridElementWidth / gridElementHeight),
            physics:
                NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 16.0),
            children: [
              CardsMenu(
                  icon: "lib/assets/images/knife.png",
                  greyTitle: "Recettes",
                  mainSubtitle: "6",
                  subtitle: "recettes"),
              CardsMenu(
                  icon: "lib/assets/images/plate.png",
                  greyTitle: "Portions",
                  mainSubtitle: "4",
                  subtitle: "pers."),
              CardsMenu(
                  icon: "lib/assets/images/chrono.png",
                  greyTitle: "Préparation",
                  mainSubtitle: "2",
                  subtitle: "h"),
              CardsMenu(
                icon: "lib/assets/images/star.png",
                greyTitle: "Gain de temps",
                mainSubtitle: "4",
                subtitle: "h",
              )
            ],
          ),
          AsterixText(
              asterix:
                  "* Durée estimée en fonction du temps de préparation calculé par notre algorithme. "),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 30),
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFF9F8E1),
                          spreadRadius: 0,
                          blurRadius: 24,
                          offset: Offset(0, 20)),
                    ],
                  ),
                  child: SizedBox(
                    height: 900.0,
                    child: Column(children: [
                      Expanded(
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, top: 5),
                                    child: Text(
                                      'Lundi',
                                      style: ListViewStyle.headline1(context),
                                    ))),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Veggie burger au quinoa"),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Haricots rouges"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, top: 5),
                                    child: Text(
                                      'Mardi',
                                      style: ListViewStyle.headline1(context),
                                    ))),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Veggie burger au quinoa"),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Haricots rouges"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, top: 5),
                                    child: Text(
                                      'Mercredi',
                                      style: ListViewStyle.headline1(context),
                                    ))),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Veggie burger au quinoa"),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Haricots rouges"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, top: 5),
                                    child: Text(
                                      'Jeudi',
                                      style: ListViewStyle.headline1(context),
                                    ))),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Veggie burger au quinoa"),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Haricots rouges"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 10, top: 5),
                                    child: Text(
                                      'Vendredi',
                                      style: ListViewStyle.headline1(context),
                                    ))),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Veggie burger au quinoa"),
                            Plat(
                                image: Icon(Icons.insert_chart_outlined),
                                name: "Haricots rouges"),
                          ],
                        ),
                      ),
                    ]),
                  ))),
          Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.only(bottom: 30),
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFF1F1D9),
                          spreadRadius: 0,
                          blurRadius: 24,
                          offset: Offset(0, 20)),
                    ],
                  ),
                  child: SizedBox(
                    height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Allergies',
                            style: Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '4 allergènes détectés',
                            style: ListViewStyle.headline1(context),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Ce Menu contient 4 allergènes connus de nos chefs. Si vous avez un doute, n’hésitez pas à nous contacter et à vous arrêter pendant la préparation.',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              FutureBuilder<List<Data>>(
                                future: futureData,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Data> data = snapshot.data!;
                                    return ListView.builder(
                                        itemCount: data.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            height: 75,
                                            color: Colors.white,
                                            child: Center(
                                              child: Text(data[index].name),
                                            ),
                                          );
                                        });
                                  } else if (snapshot.hasError) {
                                    return Text('cheh');
                                  }
                                  // By default, show a loading spinner.
                                  return CircularProgressIndicator();
                                },
                              ),

                              // Allergene(
                              //   // image: Icon(Icons.wine_bar),
                              //   name: "Gluten"
                              // ),
                              // Allergene(
                              //   // image: Icon(Icons.wine_bar),
                              //   name: "Oeufs"
                              // ),
                              // Allergene(
                              //   // image: Icon(Icons.wine_bar),
                              //   name: "Lactose"
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
          Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.only(bottom: 20),
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFF1F1D9),
                          spreadRadius: 0,
                          blurRadius: 24,
                          offset: Offset(0, 20)),
                    ],
                  ),
                  child: SizedBox(
                    height: 540,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Ustensiles',
                            style: Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '6 ustensiles nécessaires',
                            style: ListViewStyle.headline1(context),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Nous vous listons les ustentiles qui pour nous sont indispensables à la réalisation du Menu, mais vous pouvez utiliser ce que vous voulez !',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Ustensiles(
                                  image: Icon(Icons.wine_bar),
                                  name: "Poêle(s)"),
                              Ustensiles(
                                  image: Icon(Icons.wine_bar),
                                  name: "Casseroles"),
                              Ustensiles(
                                  image: Icon(Icons.wine_bar), name: "Four"),
                              Ustensiles(
                                  image: Icon(Icons.wine_bar),
                                  name: "Planche(s)"),
                              Ustensiles(
                                  image: Icon(Icons.wine_bar),
                                  name: "Cuillère(s)"),
                              Ustensiles(
                                  image: Icon(Icons.wine_bar), name: "Fouet"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))),
        ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: StickyButton(
              buttonText: "Enregister et voir la liste de course ->",
              route: HomeScreen()),
        ));
  }
}
