class Endpoints {
  static String search(String searchTerm) =>
      'https://api.magicthegathering.io/v1/cards?name=$searchTerm';
  static String searchSpecific(String searchTerm) =>
      'https://api.magicthegathering.io/v1/cards?name="$searchTerm"';
  static String searchForeign(String searchTerm, String language) =>
      "https://api.magicthegathering.io/v1/cards?name=$searchTerm&language=$language";
}
