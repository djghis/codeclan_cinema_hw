require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => 'GG', 'funds' => '100'})
customer1.save()
customer2 = Customer.new({'name' => 'Natalie', 'funds' => '200'})
customer2.save()
customer3 = Customer.new({'name' => 'Harvey', 'funds' => '300'})
customer3.save()

film1 = Film.new({'title' => 'Spies in disguise', 'price' =>  '13'})
film1.save()
film2 = Film.new({'title' => 'Mission impossible', 'price' => '15'})
film2.save()
film3 = Film.new({'title' => 'Ho please help me!', 'price' => '5'})
film3.save()

#
# ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
# # ticket1.save()
#
# ticket2 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer2.id})
# # ticket2.save()
#
# ticket3 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer3.id})
# # ticket3.save()
#
# ticket4 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer1.id})
# # ticket4.save()
#
# ticket5 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer2.id})
# # ticket5.save()
#
# ticket6 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer3.id})
# # ticket6.save()


binding.pry
nil
