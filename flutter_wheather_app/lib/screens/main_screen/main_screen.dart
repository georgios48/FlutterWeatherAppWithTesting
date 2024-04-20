import 'package:flutter/material.dart';
import 'package:flutter_wheather_app/API/weather_data.dart';
import 'package:flutter_wheather_app/weather_icons/weather_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF3ac3cb), Color(0xFFf85187)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: weatherPage(context, width, height),
      ),
    );
  }
}

// The main widget of the page
Widget weatherPage(BuildContext context, double width, double height) {
  return FutureBuilder<Map<String, dynamic>>(
      future: WeatherService().getWeatherData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasError) {
          return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.close_rounded,
                  color: Colors.red,
                  shadows: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(8, 8),
                        spreadRadius: 10,
                        blurRadius: 10),
                  ],
                ),
                SizedBox(height: 5),
                Text("Something went wrong while fetching the data.")
              ]);
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${snapshot.data!['main']['temp'].toString().substring(0, 2)}° in ${snapshot.data!['name']}",
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
              Container(
                  child: GetWeatherIcons()
                      .getIcon(snapshot.data!["weather"][0]["icon"])),
              Text(
                "Feels like: ${snapshot.data!['main']['feels_like'].toString().substring(0, 2)}°",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "${snapshot.data!['weather'][0]['main']} - ${snapshot.data!['weather'][0]['description']}",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.1), // Adjust opacity as needed
                      borderRadius: BorderRadius.circular(
                          15.0), // Optional: Add border radius for rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                              0.01), // Adjust shadow color and opacity
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // Offset of shadow
                        ),
                      ],
                    ),
                    padding:
                        const EdgeInsets.all(10.0), // Adjust padding as needed
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Pressure: ${snapshot.data!['main']['pressure']}",
                                style: const TextStyle(color: Colors.white)),
                            Text(
                                "Humidity: ${snapshot.data!['main']['humidity']}",
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "Min temperature: ${snapshot.data!['main']['temp_min']}° ",
                                style: const TextStyle(color: Colors.white)),
                            const Text("|",
                                style: TextStyle(color: Colors.white)),
                            Text(
                              " Max temperature: ${snapshot.data!['main']['temp_max']}°",
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          );
        }
      });
}
