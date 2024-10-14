import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../videoplayer/video_player_page.dart';

class DavaoDelNortePage extends StatefulWidget {
  @override
  _DavaoDelNortePageState createState() => _DavaoDelNortePageState();
}

class _DavaoDelNortePageState extends State<DavaoDelNortePage> {
  final List<Map<String, String>> projectVideos = [
    {'project': 'Project 1', 'video': 'assets/videos/1_minute_DOST-X.mp4', 'thumbnail': 'assets/images/project1_thumbnail.png'},
    {'project': 'Project 2', 'video': 'assets/videos/1_minute_DOST-X.mp4', 'thumbnail': 'assets/images/project1_thumbnail.png'},
    {'project': 'Project 3', 'video': 'assets/videos/1_minute_DOST-X.mp4', 'thumbnail': 'assets/images/project1_thumbnail.png'},
    {'project': 'Project 4', 'video': 'assets/videos/1_minute_DOST-X.mp4', 'thumbnail': 'assets/images/project1_thumbnail.png'},
    {'project': 'Project 5', 'video': 'assets/videos/1_minute_DOST-X.mp4', 'thumbnail': 'assets/images/project1_thumbnail.png'},
    {'project': 'Project 6', 'video': 'assets/videos/1_minute_DOST-X.mp4', 'thumbnail': 'assets/images/project1_thumbnail.png'},
    {'project': 'Project 7', 'video': 'assets/videos/1_minute_DOST-X.mp4', 'thumbnail': 'assets/images/project1_thumbnail.png'},
    {'project': 'Project 8', 'video': 'assets/videos/1_minute_DOST-X.mp4', 'thumbnail': 'assets/images/project1_thumbnail.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Color(0xFF99cc33),
          title: Center(
            child: const Text(
              'Davao del Norte',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFFAFAFA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Projects',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: CarouselSlider.builder(
                itemCount: projectVideos.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final projectName = projectVideos[index]['project']!;
                  final videoPath = projectVideos[index]['video']!;
                  final thumbnailPath = projectVideos[index]['thumbnail']!;
                  return _carouselItem(projectName, videoPath, thumbnailPath);
                },
                options: CarouselOptions(
                  height: 400.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _carouselItem(String projectName, String videoPath, String thumbnailPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerPage(videoPath: videoPath),
          ),
        );
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(thumbnailPath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),

          /*
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                projectName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          */

          /*
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black, // Setting the background color to white
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                size: 60, // Reduced the size a bit for balance
                color: Colors.white, // Setting the play button color to black
              ),
            ),
          ), */

          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/play_button.png', // Path to the image
                  fit: BoxFit.cover, // Ensures the image covers the entire circle
                ),
              ),
            ),
          ),


        ),
      ),
    );
  }
}
