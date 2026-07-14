import 'package:flutter/material.dart';
import '../../models/exam_model.dart';

class ExamTile extends StatelessWidget {
  final ExamModel exam;
  final VoidCallback? onTap;

  const ExamTile({
    super.key,
    required this.exam,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,

        child: Ink(
          padding: const EdgeInsets.all(18),

          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(18),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 18,
                offset: const Offset(0, 4),
              )
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    exam.subject,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff004AC6),
                    ),
                  ),

                  Text(
                    exam.date,

                    style: const TextStyle(
                      color: Color(0xff737686),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 12),

              Text(
                exam.title,

                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [

                  const Icon(
                    Icons.schedule,
                    size: 18,
                    color: Colors.red,
                  ),

                  const SizedBox(width: 6),

                  Text(
                    exam.remainingDays,

                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}