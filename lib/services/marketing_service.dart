import 'package:mobileapp/models/marketing.dart';

List<Marketing> fetchMarketings() {
  final marketings = new List<Marketing>();

  marketings.add(Marketing(
      feed: "assets/marketing/marketing1_feed.png",
      stories: "assets/marketing/marketing1_stories.png",
      description: "",
      product: "Kit ilía Secreto"));

  marketings.add(Marketing(
      feed: "assets/marketing/marketing2_feed.png",
      stories: "assets/marketing/marketing2_stories.png",
      description: "",
      product: "Loção Loucuras de amor"));

  return marketings;
}
