require('pry')
require_relative('models/film')
require_relative('models/customer')
require_relative('models/ticket')

Ticket.delete_all
Customer.delete_all
Film.delete_all

film1 = Film.new({
  'title' => 'Groundhog Day',
  'price' => '5'
  })
  film1.save

  film2 = Film.new({
    'title' => 'Tron',
    'price' => '6'
    })
    film2.save

    customer1 = Customer.new({
      'name' => 'Henry',
      'funds' => '60'
      })
      customer1.save

      customer2 = Customer.new({
        'name' => 'Joanna',
        'funds' => '50'
        })
        customer2.save

        ticket1 = Ticket.new ({
          'film_id' => film1.id,
          'customer_id' => customer1.id
          })
          ticket1.save

          ticket2 = Ticket.new({
            'film_id' => film2.id,
            'customer_id' => customer2.id
            })
            ticket2.save

      movie1 binding.pry
      nil
