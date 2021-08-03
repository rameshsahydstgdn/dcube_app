// To parse this JSON data, do
//
//     final wordResponse = wordResponseFromJson(jsonString);

import 'dart:convert';

List<WordResponse> wordResponseFromJson(String str) => List<WordResponse>.from(
    json.decode(str).map((x) => WordResponse.fromJson(x)));

String wordResponseToJson(List<WordResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordResponse {
  WordResponse({
    this.word,
    this.phonetics,
    this.meanings,
  });

  String? word;
  List<Phonetic>? phonetics;
  List<Meaning>? meanings;

  factory WordResponse.fromJson(Map<String, dynamic> json) => WordResponse(
        word: json["word"] == null ? null : json["word"],
        phonetics: json["phonetics"] == null
            ? null
            : List<Phonetic>.from(
                json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: json["meanings"] == null
            ? null
            : List<Meaning>.from(
                json["meanings"].map((x) => Meaning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word == null ? null : word,
        "phonetics": phonetics == null
            ? null
            : List<dynamic>.from(phonetics!.map((x) => x.toJson())),
        "meanings": meanings == null
            ? null
            : List<dynamic>.from(meanings!.map((x) => x.toJson())),
      };
}

class Meaning {
  Meaning({
    this.partOfSpeech,
    this.definitions,
  });

  String? partOfSpeech;
  List<Definition>? definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech:
            json["partOfSpeech"] == null ? null : json["partOfSpeech"],
        definitions: json["definitions"] == null
            ? null
            : List<Definition>.from(
                json["definitions"].map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech == null ? null : partOfSpeech,
        "definitions": definitions == null
            ? null
            : List<dynamic>.from(definitions!.map((x) => x.toJson())),
      };
}

class Definition {
  Definition({
    this.definition,
    this.example,
    this.synonyms,
  });

  String? definition;
  String? example;
  List<String>? synonyms;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"] == null ? null : json["definition"],
        example: json["example"] == null ? null : json["example"],
        synonyms: json["synonyms"] == null
            ? null
            : List<String>.from(json["synonyms"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "definition": definition == null ? null : definition,
        "example": example == null ? null : example,
        "synonyms": synonyms == null
            ? null
            : List<dynamic>.from(synonyms!.map((x) => x)),
      };
}

class Phonetic {
  Phonetic({
    this.text,
    this.audio,
  });

  String? text;
  String? audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"] == null ? null : json["text"],
        audio: json["audio"] == null ? null : json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "text": text == null ? null : text,
        "audio": audio == null ? null : audio,
      };
}
