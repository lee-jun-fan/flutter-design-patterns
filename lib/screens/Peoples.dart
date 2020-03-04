import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';

class Peoples extends StatelessWidget {
  final img = [
    {
      "imageUrl":
          "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/09/27/f4dd7c10-e0ca-11e9-94c8-f27aa1da2f45_image_hires_101713.JPG?itok=K-_8RuBa&v=1569550639"
    },
    {
      "imageUrl":
          "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/09/27/f4dd7c10-e0ca-11e9-94c8-f27aa1da2f45_image_hires_101713.JPG?itok=K-_8RuBa&v=1569550639"
    },
    {
      "imageUrl":
          "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/09/27/f4dd7c10-e0ca-11e9-94c8-f27aa1da2f45_image_hires_101713.JPG?itok=K-_8RuBa&v=1569550639"
    },
    {
      "imageUrl":
          "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/09/27/f4dd7c10-e0ca-11e9-94c8-f27aa1da2f45_image_hires_101713.JPG?itok=K-_8RuBa&v=1569550639"
    },
    {
      "imageUrl":
          "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/09/27/f4dd7c10-e0ca-11e9-94c8-f27aa1da2f45_image_hires_101713.JPG?itok=K-_8RuBa&v=1569550639"
    },
    {
      "imageUrl":
          "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/09/27/f4dd7c10-e0ca-11e9-94c8-f27aa1da2f45_image_hires_101713.JPG?itok=K-_8RuBa&v=1569550639"
    },
    {
      "imageUrl":
          "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/09/27/f4dd7c10-e0ca-11e9-94c8-f27aa1da2f45_image_hires_101713.JPG?itok=K-_8RuBa&v=1569550639"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "STORIES (30)",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "ACTIVE (144)",
                  ),
                )
              ],
            )),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              children: img
                  .map((f) => Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            
                            image: DecorationImage(
                                image: NetworkImage(f['imageUrl']),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Chit Ye Aung",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ))
                  .toList()),
        )),
      ],
    );
  }
}
