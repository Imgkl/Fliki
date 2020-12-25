import 'dart:convert';

// Model for the SearchResult

SearchResult searchResultFromJson(String str) =>
    SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  SearchResult({
    this.batchcomplete,
    this.searchResultContinue,
    this.query,
  });

  bool batchcomplete;
  Continue searchResultContinue;
  Query query;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        batchcomplete:
            json["batchcomplete"] == null ? null : json["batchcomplete"],
        searchResultContinue: json["continue"] == null
            ? null
            : Continue.fromJson(json["continue"]),
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
      );

  Map<String, dynamic> toJson() => {
        "batchcomplete": batchcomplete == null ? null : batchcomplete,
        "continue":
            searchResultContinue == null ? null : searchResultContinue.toJson(),
        "query": query == null ? null : query.toJson(),
      };
}

class Query {
  Query({
    this.pages,
  });

  List<Page> pages;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        pages: json["pages"] == null
            ? null
            : List<Page>.from(json["pages"].map((x) => Page.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pages": pages == null
            ? null
            : List<dynamic>.from(pages.map((x) => x.toJson())),
      };
}

class Page {
  Page({
    this.pageid,
    this.ns,
    this.title,
    this.index,
    this.extract,
    this.thumbnail,
    this.terms,
    this.url,
  });
  String extract;
  int pageid;
  int ns;
  String url;
  String title;
  int index;
  Thumbnail thumbnail;
  Terms terms;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        pageid: json["pageid"] == null ? null : json["pageid"],
        ns: json["ns"] == null ? null : json["ns"],
        title: json["title"] == null ? null : json["title"],
        index: json["index"] == null ? null : json["index"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        extract: json["extract"] == null ? null : json["extract"],
        url: json["fullurl"] == null ? null : json["fullurl"],
        terms: json["terms"] == null ? null : Terms.fromJson(json["terms"]),
      );

  Map<String, dynamic> toJson() => {
        "pageid": pageid == null ? null : pageid,
        "ns": ns == null ? null : ns,
        "title": title == null ? null : title,
        "index": index == null ? null : index,
        "url": url == null ? null : url,
        "extract": extract == null ? null : extract,
        "thumbnail": thumbnail == null ? null : thumbnail.toJson(),
        "terms": terms == null ? null : terms.toJson(),
      };
}

class Terms {
  Terms({
    this.description,
  });

  List<String> description;

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        description: json["description"] == null
            ? null
            : List<String>.from(json["description"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description == null
            ? null
            : List<dynamic>.from(description.map((x) => x)),
      };
}

class Thumbnail {
  Thumbnail({
    this.source,
    this.width,
    this.height,
  });

  String source;
  int width;
  int height;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        source: json["source"] == null ? null : json["source"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toJson() => {
        "source": source == null ? null : source,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}

class Continue {
  Continue({
    this.gpsoffset,
    this.continueContinue,
  });

  int gpsoffset;
  String continueContinue;

  factory Continue.fromJson(Map<String, dynamic> json) => Continue(
        gpsoffset: json["gpsoffset"] == null ? null : json["gpsoffset"],
        continueContinue: json["continue"] == null ? null : json["continue"],
      );

  Map<String, dynamic> toJson() => {
        "gpsoffset": gpsoffset == null ? null : gpsoffset,
        "continue": continueContinue == null ? null : continueContinue,
      };
}
