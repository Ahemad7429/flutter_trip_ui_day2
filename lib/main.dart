import 'package:flutter/material.dart';
import 'package:trip_ui_day2/fade_animation.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Nunito'),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _totalPage = 4;

  void _onScroll() {
    //print('scrolled');
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPage({title, description, image, page}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FadeAnimation(
                    2,
                    child: Text(
                      page.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '/$_totalPage',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      1.0,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 50,
                          height: 1.2,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.5,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: Icon(Icons.star,
                                color: Colors.yellow, size: 15),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: Icon(Icons.star,
                                color: Colors.yellow, size: 15),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: Icon(Icons.star,
                                color: Colors.yellow, size: 15),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: Icon(Icons.star,
                                color: Colors.yellow, size: 15),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child:
                                Icon(Icons.star, color: Colors.grey, size: 15),
                          ),
                          Text('4.0', style: TextStyle(color: Colors.white70)),
                          Text('(2300)',
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 12))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      2.0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          description,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            height: 1.9,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      2.5,
                      child: Text(
                        'READ MORE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          _buildPage(
              page: 1,
              title: 'Yosemite National Park',
              description:
                  'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
              image: 'assets/images/one.jpg'),
          _buildPage(
              page: 2,
              title: 'Golden Gate Bridge',
              description:
                  'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
              image: 'assets/images/two.jpg'),
          _buildPage(
              page: 3,
              title: 'Sedona',
              description:
                  "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful.",
              image: 'assets/images/three.jpg'),
          _buildPage(
              page: 4,
              title: 'Savannah',
              description:
                  'Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.',
              image: 'assets/images/four.jpg'),
        ],
      ),
    );
  }
}
