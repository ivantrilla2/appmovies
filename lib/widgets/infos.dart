import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/models/actor.dart';

class Infos extends StatelessWidget {
  const Infos({Key? key, required this.actor}) : super(key: key);
  
  final Actor actor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              actor.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/Star.svg'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    actor.popularity == 0.0
                        ? 'N/A'
                        : actor.popularity.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFF8700),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.work,
                    color: Color(0xFFFF8700),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Known for: ${actor.knownForDepartment}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFF8700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
