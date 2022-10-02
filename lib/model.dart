// ignore_for_file: public_member_api_docs, sort_constructors_first
class Users {
  final String image;
  final String name;
  final String nickName;
  bool followerd;
  Users({
    required this.image,
    required this.name,
    required this.nickName,
    required this.followerd,
  });
}

final users = [
  Users(
    image: 'images/maestro.jpg',
    name: 'Maestro',
    nickName: '@maestro',
    followerd: false,
  ),
  Users(
    image: 'images/martina-wolna.jpg',
    name: 'Martina',
    nickName: '@martina',
    followerd: false,
  ),
  Users(
    image: 'images/mickelJordan.jpg',
    name: 'Michel Jordan',
    nickName: '@jordan',
    followerd: false,
  ),
  Users(
    image: 'images/natasha.jpg',
    name: 'Natasha',
    nickName: '@natasha',
    followerd: false,
  ),
  Users(
    image: 'images/programmer.png',
    name: 'Ali',
    nickName: '@ali',
    followerd: false,
  ),
  Users(
    image: 'images/rafaulla.jpg',
    name: 'Rafaulla',
    nickName: '@rafaulla',
    followerd: false,
  ),
  Users(
    image: 'images/raul.jpg',
    name: 'Raul',
    nickName: '@raul',
    followerd: false,
  ),
];
