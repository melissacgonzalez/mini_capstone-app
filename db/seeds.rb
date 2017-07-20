Supplier.create!([
  {name: "Firebox", email: "firebox@email.com", phone_number: "(312)555-1234"},
  {name: "Mystics R Us", email: "mysticsrus@email.com", phone_number: "(800)555-1234"},
  {name: "New Holland Brewing Company", email: "newholland@email.com", phone_number: "(773)555-1235"}
])

Product.create!([
  {name: "Phoenix Feathers", price: "69.99", image: "https://debeysklenar.files.wordpress.com/2013/04/fire_feather_by_brent_the_clawbrent-the-claw-deviantart-com.jpg", description: "Soft and firey!", quantity: 17, supplier_id: 3},
  {name: "Test Product", price: "0.97", image: "https://www.paconferenceforwomen.org/wp-content/uploads/2014/10/test1.jpg", description: "This isn't a real thing... Not like everything else on this page", quantity: 0, supplier_id: 3},
  {name: "Bigfoot Footprint", price: "29.97", image: " ", description: "Imprint of a real footprint left by Bigfoot!", quantity: 23, supplier_id: 3},
  {name: "Dragon's Milk", price: "37.99", image: "http://www.frontporchrepublic.com/wp-content/uploads/2014/10/new-holland-dragons-milk-review.preview.jpg", description: "Dark & smooth.  This will mess you up!", quantity: 32, supplier_id: 2},
  {name: "Unicorn Tears", price: "49.99", image: "https://media.firebox.com/product/6970/extra1_column_grid_8/unicorn-tears-gin-liqueur_24067.jpg", description: "Very rare sadness", quantity: 25, supplier_id: 1}
])

