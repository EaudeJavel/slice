import 'package:flutter/material.dart';
import 'package:sliceapp/slice_theme.dart';

class CardsMenu extends StatelessWidget {
	final String icon;
	final String greyTitle;
	final String mainSubtitle;
	final String subtitle;

  
  const CardsMenu({ 
	Key? key,
	required this.icon,
	required this.greyTitle,
	required this.mainSubtitle,
	required this.subtitle, 
	}): super(key: key);

  @override
  Widget build(BuildContext context) {
	  return Container(
			child: Card(
				color: Colors.white,         
				child: InkWell(
					splashColor: Colors.yellow.withAlpha(30),
					// elevation: 1,
					onTap: () {
						print('card');
					},
					child: Column(
						mainAxisSize: MainAxisSize.min,
						mainAxisAlignment: MainAxisAlignment.center,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[   
							Container(
							margin: const EdgeInsets.only(left: 12),
								child: Image.asset(icon),
							),
							Container(
								margin: const EdgeInsets.only(top: 10, bottom: 10, left: 12),
								child: Text(
									greyTitle,
									style: CardTextStyle.headline2(context),
									textAlign: TextAlign.center,
								),
							),
							Row(
							children: [
								Container(
									margin: const EdgeInsets.only(left: 12),
									child: Text(
										mainSubtitle,
										style: CardTextStyle.headline1(context),
										textAlign: TextAlign.center,
									),
								),
								Container(
									margin: const EdgeInsets.only(left: 5),
									child: Text(
										subtitle,
										style: CardTextStyle.headline3(context),
										textAlign: TextAlign.center,
									)
								),
							],
							)
						],
					),
				)
			),
		);
	}
}

