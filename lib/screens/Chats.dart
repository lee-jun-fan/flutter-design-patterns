import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  final myDays = [
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
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(.5),
                  ),
                  hintText: "Search"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 90,
            child: ListView.builder(
                
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext cxt, int index) {
                  if (index == 0) {
                    return Column(
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                        ),
                        Text("Your Story")
                      ],
                    );
                  } else {
                    return _listItem(myDays[0]);
                  }
                }),
          ),
         
          Column(
            children: myDays.map((f) => _messageItem()).toList(),
          )
        ],
      ),
    );
  }

  Widget _listItem(Map<String, String> day) {
    final name = "Chit Ye";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 7, left: 7),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[600], width: 3),
              shape: BoxShape.circle),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                shape: BoxShape.circle),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(day['imageUrl']), fit: BoxFit.fill),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        Text(name.length > 7 ? name.substring(0, 7)+"...": name),
      ],
    );
  }

  Widget _messageItem() {
    final message = "ချစ်ရဲအောင်ရေ နင်အခုဘာလုပ်နေတာလဲ ငါထန်နေလို့ပါ";
    final name = "Chit Ye Aung";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(6),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(myDays[0]['imageUrl']))),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            children: <Widget>[
              Text(
                name.length > 27 ? name.substring(0, 24) + "..." : name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Row(
                children: <Widget>[
                  Text(message.length > 24
                      ? message.substring(0, 21) + "..."
                      : message),
                  Text(" 6:44 PM")
                ],
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          )
        ],
      ),
    );
  }
}
