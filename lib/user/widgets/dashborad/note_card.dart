import 'package:flutter/material.dart';
import '../../models/note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final VoidCallback? onTap;

  const NoteCard({
    super.key,
    required this.note,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onTap,

        borderRadius: BorderRadius.circular(20),

        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 20,
                offset: const Offset(0, 4),
              )
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// IMAGE

              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),

                child: Container(
                  height: 140,
                  width: double.infinity,

                  color: const Color(0xffDBE1FF),

                  child: note.imageUrl.isEmpty
                      ? const Icon(
                          Icons.menu_book,
                          size: 60,
                          color: Color(0xff004AC6),
                        )
                      : Image.network(
                          note.imageUrl,
                          fit: BoxFit.cover,
                        ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    /// SUBJECT CHIP

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xffDBE1FF),

                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Text(
                        note.subject,

                        style: const TextStyle(
                          color: Color(0xff004AC6),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Text(
                      note.title,

                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff191C1E),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      note.description,

                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        color: Color(0xff737686),
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [

                        const Icon(
                          Icons.schedule,
                          size: 18,
                          color: Color(0xff737686),
                        ),

                        const SizedBox(width: 6),

                        Text(
                          note.lastEdited,

                          style: const TextStyle(
                            color: Color(0xff737686),
                            fontSize: 12,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}