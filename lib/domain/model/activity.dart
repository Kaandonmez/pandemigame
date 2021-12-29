class Activities {
  String name = "";
  int socialDistance = 0;
  int memberCount = 0;
  bool isActive = true;

  Activities(String Name, int SocialDistance, bool isActive) {
    name = Name;
    socialDistance = SocialDistance;
    isActive = isActive;
    //memberCount += 1;
    //! hobiler humanlar oluşturulurken ekleniyor ancak hobiler 1 kere create ediliyor memberCount şuan gereksiz.
  }

  void incrementMemberCount() {
    memberCount += 1;
  }

  void decrementMemberCount() {
    memberCount -= 1;
  }

  void changeStatus() {
    isActive = !isActive;
  }

  @override
  String toString() {
    return name +
        " " +
        socialDistance.toString() +
        "...   " +
        isActive.toString();
  }
}
