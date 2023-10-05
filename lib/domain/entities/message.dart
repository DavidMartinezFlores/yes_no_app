enum FromWho { mine, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({text, imageUrl, fromWho})
      : this.text = text,
        this.imageUrl = imageUrl,
        this.fromWho = fromWho;
}
