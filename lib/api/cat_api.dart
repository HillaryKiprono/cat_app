import 'network.dart';

const String apiKey = '''live_hHrnvIeiJQm6fZ6zYQ2rEv2CnjgXYGoPs9qIOHO1aTSK9uQVTxTEwLFuIHUJcVgT''';
// 1
const String catAPIURL = 'https://api.thecatapi.com/v1/breeds?';
// 2
const String catImageAPIURL = 'https://api.thecatapi.com/v1/images/search?';
// 3
const String breedString = 'breed_id=';
// 4
const String apiKeyString = 'x-api-key=$apiKey';

class CatAPI {
  // 5
  Future<String> getCatBreeds() async {
    // 6
    final network = Network('$catAPIURL$apiKeyString');
    // 7
    final catData = await network.getData();
    return catData;
  }
  // 8
  Future<String> getCatBreed(String breedName) async {
    final network =
    Network('$catImageAPIURL$breedString$breedName&$apiKeyString');
    final catData = await network.getData();
    return catData;
  }
}