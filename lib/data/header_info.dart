class HeaderInfo {
  final String name;
  final String specialties;
  final String location;
  final String email;
  final String headshotUrl; 
  final Map<String, String> links; 

  const HeaderInfo({
    required this.name,
    required this.specialties,
    required this.location,
    required this.email,
    required this.headshotUrl,
    required this.links,
  });
}

// Header info
const header = HeaderInfo(
  name: 'SHANNA WALLACE',
  specialties: 'Cloud-native full-stack app development (AWS)  •  Machine Learning Research  •  Project Management',
  location: 'Knoxville, TN',
  email: 'shannatw04@gmail.com',
  headshotUrl:
      'assets/images/headshot.jpg',
  links: {
    'GitHub': 'https://github.com/shannaw04',
    'LinkedIn': 'https://www.linkedin.com/in/shanna-wallace',
    'Portfolio': 'shannaw04.github.io',
  },
);
