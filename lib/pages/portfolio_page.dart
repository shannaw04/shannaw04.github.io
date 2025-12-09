import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/data/project_info.dart';
import 'package:portfolio/themes/app_styles.dart';
import 'package:portfolio/widgets/about_card.dart';
import 'package:portfolio/widgets/header_card.dart';
import 'package:portfolio/widgets/project_card.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  String? _bio;
  List<Project>? _projects;

  @override
  void initState() {
    super.initState();
    _loadBio();
    _loadProjects();
  }

  Future<void> _loadBio() async {
    final bioText = await rootBundle.loadString('assets/bio_info/bio.txt');
    setState(() {
      _bio = bioText;
    });
  }

  Future<void> _loadProjects() async {
    final projects = await ProjectRepository.loadProjects();
    setState(() {
      _projects = projects;
    });
  }

  @override
  Widget build(BuildContext context) {
    // last update date (displayed at bottom)
    final updateDate = '12/9/2025';

    // Number of columns in the grid depends on screen width
    final width = MediaQuery.of(context).size.width;
    int colCount = 1;
    if (width >= 1000) {
      colCount = 3;
    } else if (width >= 650){
       colCount = 2;
    }
    

    return Scaffold(

      // Background image
      body: Container( 
        decoration: const BoxDecoration( 
          color: AppColors.darkBackground,
          image: DecorationImage(image: AssetImage(AppTextures.cubes),
          repeat: ImageRepeat.repeat, 
          opacity: 1.0, 
        ),
      ),
        child: SafeArea(
          child: Center(

            // Header Container
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Header Section
                  HeaderCard(),

                  // Spacer
                  const SizedBox(height: 16),

                  // About Me Section
                  if (_bio == null) 
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('"About Me" Info Unavailable'),
                      ),
                    )
                  else
                  AboutCard(bio: _bio!),

                  // Spacer                  
                  const SizedBox(height: 16),

                  // Project Section
                  if (_projects == null)
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    )
                  else if (_projects!.isEmpty)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Center(
                          child: Text(
                            'Under Construction',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    )
                  else
                    Builder(builder: (context) {
                      final projects = _projects!;
                      final total = projects.length;

                      // Number of rows
                      final rowCount = (total / colCount).ceil();

                      return ListView.builder(
                        itemCount: rowCount,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, rowIndex) {
                          final start = rowIndex * colCount;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: List.generate(colCount, (colIndex) {
                                  final itemIndex = start + colIndex;
                                  final hasItem = itemIndex < total;

                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: colIndex == 0 ? 0 : 8,
                                        right: colIndex == colCount - 1 ? 0 : 8,
                                      ),
                                      child: hasItem
                                          ? ProjectCard(project: projects[itemIndex])
                                          : const SizedBox.shrink(), // empty slot, keeps width
                                    ),
                                  );
                                }),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  // Spacer
                  const SizedBox(height: 24),

                  // Bottom of page
                  Center(
                    child: Text('Last updated: $updateDate'),
                  ),

                  // Spacer
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}