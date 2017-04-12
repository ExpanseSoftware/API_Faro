# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categoria1 = Category.create(category_name: 'Restaurantes', category_description: 'Boliches de comida', category_active: true)
companyType1 = CompanyType.create(company_type_name: 'Empresa')
company1 = categoria1.companies.create(company_type_id: 1, company_name: 'Burguer King', company_description: 'La mejor comida rapida del pais', company_active: true)
BranchType.create(branch_type_name: 'Offline')
branch1 = company1.branches.create(branch_active: true, branch_type_id: 1, branch_address: 'Av. America', branch_coordinates: '120.20 ,130.40')
service1 = company1.services.create(service_name: 'entrega a domicilio', service_description: "realizamos entregas a domicilio", service_active: true)
product1 = company1.products.create(product_name: 'Whopper', product_description: 'hamburguesa de carne',
    product_price: 27.50, product_active: true, product_sold_quantity: 10)
company1.products.create(product_name: 'Whopper Jr.', product_description: 'hamburguesa de carne',
    product_price: 27.50, product_active: true, product_sold_quantity: 10)
company1.products.create(product_name: 'Chicken Tenders', product_description: 'hamburguesa de carne',
    product_price: 27.50, product_active: true, product_sold_quantity: 10)
promotion1 = company1.promotions.create(promotion_name: 'Promocion fin de mes', promotion_description: 'llevate 2 hamburguesas y recibes un refresco de regalo',
    promotion_active: true)
company1.promotions.create(promotion_name: 'Promocion dos por uno', promotion_description: 'llevate 2 hamburguesas y recibes un refresco de regalo',
    promotion_active: true)
promo_relations1 = product1.promo_relations.create(promotion_id: 1)
user1 = User.create(user_name: 'Esteban', user_first_lastname: 'Navia', user_second_lastname: 'Jairo', user_nickname: 'Naja', user_password: 'amigo',
    user_gender: 'masculino', user_token: 'jahsdajshdka', user_birthday: DateTime.new(2009,9,1,17), user_birthplace: 'Bolivia')
UserType.create(user_status: 'seguidor', company_id: 1, user_id: 1)
PhoneType.create(phone_type_name: 'Celular')
PhoneType.create(phone_type_name: 'Fijo')
user1.phones.create(phone_number: '72234567', phone_type_id: 1)
branch1.phones.create(phone_number: '4223589', phone_type_id: 2)
