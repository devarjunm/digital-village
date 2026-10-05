import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F5),
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Location
            Row(
              children: const [
                Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                SizedBox(width: 6),
                Text(
                  "Nashik, Maharashtra",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Current Weather Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: const [

                  Icon(
                    Icons.cloud,
                    size: 70,
                    color: Colors.white,
                  ),

                  SizedBox(height: 10),

                  Text(
                    "28°C",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    "Cloudy",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: [

                      WeatherInfo(
                        icon: Icons.water_drop,
                        label: "Humidity",
                        value: "62%",
                      ),

                      WeatherInfo(
                        icon: Icons.umbrella,
                        label: "Rain",
                        value: "20%",
                      ),

                      WeatherInfo(
                        icon: Icons.air,
                        label: "Wind",
                        value: "12 km/h",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Today's Weather
            const Text(
              "Today's Weather",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  WeatherRow(
                    time: "Morning",
                    icon: Icons.wb_sunny,
                    temperature: "25°C",
                  ),
                  WeatherRow(
                    time: "Afternoon",
                    icon: Icons.cloud,
                    temperature: "30°C",
                  ),
                  WeatherRow(
                    time: "Evening",
                    icon: Icons.cloud,
                    temperature: "27°C",
                  ),
                  WeatherRow(
                    time: "Night",
                    icon: Icons.nights_stay,
                    temperature: "23°C",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 7 Day Forecast
            const Text(
              "7-Day Forecast",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [

                  ForecastCard(
                    day: "Today",
                    icon: Icons.cloud,
                    high: "30°",
                    low: "23°",
                  ),

                  ForecastCard(
                    day: "Fri",
                    icon: Icons.cloud,
                    high: "30°",
                    low: "23°",
                  ),

                  ForecastCard(
                    day: "Sat",
                    icon: Icons.water_drop,
                    high: "26°",
                    low: "22°",
                  ),

                  ForecastCard(
                    day: "Sun",
                    icon: Icons.water_drop,
                    high: "26°",
                    low: "22°",
                  ),

                  ForecastCard(
                    day: "Mon",
                    icon: Icons.cloud,
                    high: "27°",
                    low: "23°",
                  ),

                  ForecastCard(
                    day: "Tue",
                    icon: Icons.cloud,
                    high: "30°",
                    low: "21°",
                  ),

                  ForecastCard(
                    day: "Wed",
                    icon: Icons.cloud,
                    high: "29°",
                    low: "22°",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherInfo({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}


class WeatherRow extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;

  const WeatherRow({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            icon,
            color: Colors.orange,
          ),
          const SizedBox(width: 20),
          Text(
            temperature,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


class ForecastCard extends StatelessWidget {
  final String day;
  final IconData icon;
  final String high;
  final String low;

  const ForecastCard({
    super.key,
    required this.day,
    required this.icon,
    required this.high,
    required this.low,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Icon(
            icon,
            size: 32,
            color: Colors.green,
          ),

          const SizedBox(height: 10),

          Text(
            "$high / $low",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}