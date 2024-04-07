 class Arret {
  final String title, description;
  final int long, lat, id;
  final String heure;
  final String etat;
  final String image;


  Arret({
    required this.id, required this.title,
    required this.long, required this.description,
    required this.lat,required this.heure,
    required this.etat,
    required this.image,
  });
}
List<Arret> arrets = [
  Arret(
      id: 1,
      title: "Sousse Sud",
      long: 234,
      lat: 12,
      description: "sousse",
      heure: "10:00",
      etat: "Retard",
      image: "Assets/images/mapIcon.svg"
  ),
  Arret(
      id: 2,
      title: "Monastir faculte",
      long: 234,
      lat: 12,
      description: "monastir",
      heure: "10:30",
      etat: "a lheure",
      image: "Assets/images/mapIcon.svg"
  ),

];

