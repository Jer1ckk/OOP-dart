enum Skill { FLUTTER(500), DART(200), OTHER(100);
  final int bonus;
  const Skill(this.bonus);
}

class Employee {
  final String _name;
  double _baseSalary;
  List<Skill> _skills;
  int _yearOfExperience;
  Address _address;

  Employee(this._name, this._baseSalary, this._skills , this._address, this._yearOfExperience);

  Employee.mobileDeveloper(this._name, this._baseSalary, this._address, this._yearOfExperience) : this._skills = [Skill.FLUTTER, Skill.DART];

// getter
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skill => List.unmodifiable(_skills);  // unmodifiable: protect outsider to add new element to list
  int get yearOfExperience => _yearOfExperience;
  Address get address => _address;

  double salary(){
    double total = _yearOfExperience*1000 + _baseSalary;
    for (Skill skill in _skills) {
      total += skill.bonus;
    }
    return total;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary} salary: ${salary()}');
  }
}

class Address{
  final String city;
  final String street;
  final String zipCode;

  Address({required this.street, required this.city, required this.zipCode});
}

void main() {

  var add1 = Address(street: '21A', city: 'Takmao', zipCode: '123');
  var emp1 = Employee.mobileDeveloper('Davin', 40000, add1, 2);
  emp1.printDetails();

  // var emp2 = Employee('Ronan', 45000);
  // emp2.printDetails();
}
