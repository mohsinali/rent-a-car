class CreateMakeService
  def call
    Make.create(name: "Honda")
    Make.create(name: "Suzuki")
    Make.create(name: "Toyota")
  end
end
