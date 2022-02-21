import 'package:flutter/material.dart';
import 'package:sliceapp/slice_theme.dart';
import 'package:sliceapp/components/globals/cardsMenu.dart';
import 'package:sliceapp/components/globals/pageTitle.dart';
import 'package:sliceapp/components/globals/mainSliceTitle.dart';
import 'package:sliceapp/components/globals/pageDescription.dart';
import 'package:sliceapp/components/globals/mainButton.dart';
import 'package:sliceapp/components/globals/asterixDescription.dart';
import 'package:sliceapp/components/globals/tile.dart';
import 'package:sliceapp/components/globals/clickableIngredients.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CourseScreenState();
}

final List<String> entries = <String>[
  'Tout',
  'Chez Vous',
  'Epicerie',
  'Fruits et légumes'
];
bool isEnableTile = true;

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          PageTitle(
              pageTitle: "Liste de course",
              headerImg: 'lib/assets/images/header_home.png'),
          MainTitle(title: "Votre liste de course"),
          PageDescription(
              description:
                  "Retrouvez tous les ingrédients de votre Menu ci-dessous !"),
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
            ],
          ),
          AsterixText(
              asterix:
                  "* Durée variable en fonction de vos habitudes de course."),
          const SizedBox(height: 10),
          MainButton(
              buttonText: "C'est parti, on fait les courses ->",
              route: _ListeScreenState()),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.grey,
            ),
            child: Text(
              'Faire les courses plus tard',
              style: TextStyle(
                  fontSize: 16.0, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _ListeScreenState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Liste de course',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        backgroundColor: Color(0xFFFEF1D7),
        body: ListView(children: <Widget>[
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
                  greyTitle: "Ingrédients",
                  mainSubtitle: "0",
                  subtitle: "/34"),
              CardsMenu(
                  icon: "lib/assets/images/plate.png",
                  greyTitle: "Prix(estimation)",
                  mainSubtitle: "45",
                  subtitle: "€"),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.white,
            height: 1300,
            child: Container(
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
                      height: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              'Epicerie',
                              style: ListViewStyle.headline1(context),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                clickableIngredients(
                                  title: "Pain à burger",
                                  clickedTitle: "Pain à burger acheté",
                                  img: Image.asset(
                                      'lib/assets/images/bread.png'),
                                ),
                                clickableIngredients(
                                    img: Image.asset(
                                        'lib/assets/images/cereal.png'),
                                    clickedTitle: "Haricots achetés",
                                    title: "Haricots rouges en boite"),
                                clickableIngredients(
                                  img:
                                      Image.asset('lib/assets/images/nuts.png'),
                                  title: "Quinoa",
                                  clickedTitle: "Quinoa acheté",
                                ),
                                clickableIngredients(
                                  img: Image.asset(
                                      'lib/assets/images/cereal.png'),
                                  title: "Flocon d'avoine",
                                  clickedTitle: "Flocons d'avoine achetés",
                                ),
                                clickableIngredients(
                                  img: Image.asset(
                                      'lib/assets/images/tomato.png'),
                                  title: "Concentré de tomates",
                                  clickedTitle: "Concentré de tomates acheté",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              'Fruits et légumes',
                              style: ListViewStyle.headline1(context),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/avocado.png'),
                                    tileTitle: "Avocat"),
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/salad.png'),
                                    tileTitle: "Roquette"),
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/nuts.png'),
                                    tileTitle: "Gousse d'ail"),
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/cereal.png'),
                                    tileTitle: "Coriande"),
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/tomato.png'),
                                    tileTitle: "Kiwi"),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            child: Text(
                              'Chez vous',
                              style: ListViewStyle.headline1(context),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/avocado.png'),
                                    tileTitle: "Vinaigre balsamique"),
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/salad.png'),
                                    tileTitle: "Huile d'olive"),
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/nuts.png'),
                                    tileTitle: "Miel"),
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/cereal.png'),
                                    tileTitle: "Moutarde de Dijon"),
                                CustomTile(
                                    icon: Image.asset(
                                        'lib/assets/images/bread.png'),
                                    tileTitle: "Farine"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))),
          ),
        ]));
  }
}
