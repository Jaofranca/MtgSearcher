class Endpoints {
  static String search(String searchTerm) =>
      'https://api.magicthegathering.io/v1/cards?name=$searchTerm';
}
