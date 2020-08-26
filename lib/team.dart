class Team {
  final String name;
  final String logo;
  final String pl;
  final String gd;
  final String pts;

  Team({
    this.pl,
    this.gd,
    this.pts,
    this.name,
    this.logo,
  });
}

final List<Team> teams = [
  Team(
      name: "Liverpool", logo: "liverpool.png", pl: "38", gd: "+52", pts: "99"),
  Team(name: "Man City", logo: "man_city.png", pl: "38", gd: "+67", pts: "81"),
  Team(name: "Man United", logo: "man_utd.png", pl: "38", gd: "+30", pts: "66"),
  Team(name: "Chelsea", logo: "chelsea.png", pl: "38", gd: "+15", pts: "66"),
  Team(
      name: "Leicester", logo: "leicester.png", pl: "38", gd: "+26", pts: "62"),
  Team(name: "Spurs", logo: "spurs.png", pl: "38", gd: "+14", pts: "59"),
  Team(name: "Wolves", logo: "wolves.png", pl: "38", gd: "+11", pts: "59"),
  Team(name: "Arsenal", logo: "arsenal.png", pl: "38", gd: "+8", pts: "56"),
  Team(
      name: "Sheffield Utd",
      logo: "sheffield_utd.png",
      pl: "38",
      gd: "0",
      pts: "54"),
  Team(name: "Burnley", logo: "burnley.png", pl: "38", gd: "+52", pts: "52"),
  Team(
      name: "Southampton",
      logo: "southampton.png",
      pl: "38",
      gd: "-7",
      pts: "99"),
  Team(name: "Everton", logo: "everton.png", pl: "38", gd: "-9", pts: "49"),
  Team(
      name: "Newcastle", logo: "newcastle.png", pl: "38", gd: "-12", pts: "44"),
  Team(
      name: "Cyrstal Palace",
      logo: "crystal_palace.png",
      pl: "38",
      gd: "-20",
      pts: "43"),
  Team(name: "Brighton", logo: "brighton.png", pl: "38", gd: "-19", pts: "41"),
  Team(name: "West Ham", logo: "west_ham.png", pl: "38", gd: "-15", pts: "39"),
];
