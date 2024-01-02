part of '../../view/movie_detail_view.dart';

class TagContainer extends StatelessWidget {
  const TagContainer(this.tag, {super.key});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(tag, style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
    );
  }
}
