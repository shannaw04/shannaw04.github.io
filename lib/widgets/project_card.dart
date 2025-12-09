import 'package:flutter/material.dart';
import 'package:portfolio/themes/card_styles.dart';
import 'package:portfolio/themes/font_styles.dart';
import '../data/project_info.dart';
import '../themes/app_styles.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});
  

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    // Card animation when hovered over
    return MouseRegion( 
      onEnter: (_) => setState(() => _hovering = true), 
      onExit: (_) => setState(() => _hovering = false), 

      child: AnimatedContainer( 
        // speed of the animation and how far to move it
        duration: const Duration(milliseconds: 180), 
        transform: _hovering 
          ? (Matrix4.identity()..translate(0.0, -4.0))
          : Matrix4.identity(),
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          // shadow when you hover
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: const Color.fromARGB(255, 213, 218, 219).withOpacity(0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
        ),
        
        // Project Info
        child: Card(
          margin: EdgeInsets.all(16),
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container( 
            decoration: Decorations.cardDecoration,
          
            // Card Contents
            child: Padding(
              padding: const EdgeInsets.all(16),

              // Helps everything size together as display size
              // increases/ decreases
              child: IntrinsicWidth( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Project title
                    Text(
                      widget.project.title, 
                      style: FontStyles.titleStyle(context),
                    ),

                    // This puts a line under the title
                    AppStyles.titleUnderline(),
                    
                    // const SizedBox(height: 8),
                    Text(
                      widget.project.blurb,
                      style: FontStyles.bodyStyle(context),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  
                    
                    // const SizedBox(height: 12),
                    
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.tags.map((t) => Chip(label: Text(t))).toList(),
                    ),
                    // const Spacer(),
                    // Wrap(
                    //   spacing: 12,
                    //   children: project.links.entries
                    //       .map((e) => TextButton(
                    //             onPressed: () => _launch(e.value),
                    //             child: Text(e.key),
                    //           ))
                    //       .toList(),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}