import 'package:flutter/material.dart';
import 'package:weather_app/model/hour_item.dart';
import 'package:intl/intl.dart';

class WeatherPerHour extends StatefulWidget {
  final HourItem hourItem;
  const WeatherPerHour({Key? key, required this.hourItem}) : super(key: key);

  @override
  State<WeatherPerHour> createState() => _WeatherPerHourState();
}

class _WeatherPerHourState extends State<WeatherPerHour> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              '${DateFormat('HH').format(DateTime.parse(widget.hourItem.time!))}h',
              style: const TextStyle(fontSize: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Image.network('https:${widget.hourItem.condition!.icon}',
                  height: 50, fit: BoxFit.fill),
            ),
            widget.hourItem.chance_of_rain! > 10
                ? Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      '${widget.hourItem.chance_of_rain}%',
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.blue),
                    ),
                  )
                : Container(height: 18.0),
            Text(
              '${widget.hourItem.temp_c!.round()}°',
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
