class NoteModel {
  final String title;
  final String subject;
  final String description;
  final String imageUrl;
  final String lastEdited;

  const NoteModel({
    required this.title,
    required this.subject,
    required this.description,
    required this.imageUrl,
    required this.lastEdited,
  });
}
