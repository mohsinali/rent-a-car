class CreateCarModelService
  def call
    honda_make = Make.find_by(name: 'Honda')
    suzuki_make = Make.find_by(name: 'Suzuki')
    toyota_make = Make.find_by(name: 'Toyota')
    if honda_make
      CarModel.create(name: "Civic",make: honda_make)
      CarModel.create(name: "City",make: honda_make)
      CarModel.create(name: "Accord",make: honda_make)
    end
    if suzuki_make
      CarModel.create(name: "Swift",make: suzuki_make)
      CarModel.create(name: "Cultus",make: suzuki_make)
      CarModel.create(name: "Wagon R",make: suzuki_make)
      CarModel.create(name: "Mehran",make: suzuki_make)
    end
    if toyota_make
      CarModel.create(name: "Corrola",make: toyota_make)
      CarModel.create(name: "Camry",make: toyota_make)
      CarModel.create(name: "Land Cruiser",make: toyota_make)
    end
  end
end
