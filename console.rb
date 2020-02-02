require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry-byebug')

Ticket.delete_all()
Screening.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => 'GG', 'funds' => '100'})
customer1.save()
customer2 = Customer.new({'name' => 'Natalie', 'funds' => '200'})
customer2.save()
customer3 = Customer.new({'name' => 'Harvey', 'funds' => '300'})
customer3.save()

film1 = Film.new({'title' => 'Spies in disguise', 'price' =>  '13', 'show_time' => '15:50'})
film1.save()
film2 = Film.new({'title' => 'Mission impossible', 'price' => '15', 'show_time' => '16:50'})
film2.save()
film3 = Film.new({'title' => 'Ho please help me!', 'price' => '5', 'show_time' => '17:50'})
film3.save()
film4 = Film.new({'title' => 'Spies in disguise', 'price' =>  '13', 'show_time' => '18:50'})
film4.save()
film5 = Film.new({'title' => 'Spies in disguise', 'price' =>  '13', 'show_time' => '20:00'})
film5.save()

#
ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
ticket1.save()

ticket2 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer2.id})
ticket2.save()

ticket3 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer3.id})
ticket3.save()

ticket4 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id})
ticket4.save()

ticket5 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer2.id})
ticket5.save()

ticket6 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer3.id})
ticket6.save()

ticket7 = Ticket.new({'film_id' => film5.id, 'customer_id' => customer1.id})
ticket7.save()

ticket8 = Ticket.new({'film_id' => film5.id, 'customer_id' => customer2.id})
ticket8.save()

ticket9 = Ticket.new({'film_id' => film5.id, 'customer_id' => customer3.id})
ticket9.save()

screening1 = Screening.new({'film_id' => film1.id, 'customer_id' => customer1.id})
screening1.save()

screening2 = Screening.new({'film_id' => film1.id, 'customer_id' => customer2.id})
screening2.save()

screening3 = Screening.new({'film_id' => film2.id, 'customer_id' => customer3.id})
screening3.save()

screening4 = Screening.new({'film_id' => film3.id, 'customer_id' => customer1.id})
screening4.save()

screening5 = Screening.new({'film_id' => film3.id, 'customer_id' => customer2.id})
screening5.save()

screening6 = Screening.new({'film_id' => film3.id, 'customer_id' => customer3.id})
screening6.save()

screening7 = Screening.new({'film_id' => film5.id, 'customer_id' => customer1.id})
screening7.save()

screening8 = Screening.new({'film_id' => film5.id, 'customer_id' => customer2.id})
screening8.save()

screening9 = Screening.new({'film_id' => film5.id, 'customer_id' => customer3.id})
screening9.save()


binding.pry
nil
