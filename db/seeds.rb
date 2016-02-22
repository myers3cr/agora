# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

Currency.delete_all
Currency.create(iso_code: 'USD', description: 'US Dollar')
Currency.create(iso_code: 'EUR', description: 'Euro')
Currency.create(iso_code: 'CAD', description: 'Canadian Dollar')
Currency.create(iso_code: 'GBP', description: 'British Pound Sterling')
Currency.create(iso_code: 'JPY', description: 'Japanese Yen')
Currency.create(iso_code: 'CHF', description: 'Swiss Franc')
Currency.create(iso_code: 'AUD', description: 'Australian Dollar')
Currency.create(iso_code: 'BRL', description: 'Brazilian Real')
Currency.create(iso_code: 'CZK', description: 'Czech Koruna')
Currency.create(iso_code: 'HUF', description: 'Hungarian Forint')
Currency.create(iso_code: 'INR', description: 'Indian Rupee')

OrgType.delete_all
OrgType.create(name: 'Admin')
OrgType.create(name: 'Buyer')
OrgType.create(name: 'Supplier')

Org.delete_all
Org.create(
  name:'PinchPoint',
  org_type_id: OrgType.find_by_name('Admin').id,
  currency_id: Currency.find_by_iso_code('USD').id
)
Org.create(
  name: 'Demo Buyer',
  org_type_id: OrgType.find_by_name('Buyer').id,
  currency_id: Currency.find_by_iso_code('USD').id
)
Org.create(
  name: 'Demo Supplier',
  org_type_id: OrgType.find_by_name('Supplier').id,
  currency_id: Currency.find_by_iso_code('USD').id
)

User.delete_all
User.create(
  username: 'admin',
  first_name: 'Admin',
  last_name: 'User',
  org_id: Org.find_by_name('PinchPoint').id,
  email: 'admin@nowhere.com',
  phone: '(585) 555-1212',
  password: 'secret',
  password_confirmation: 'secret'
)
User.create(
  username: 'buyer',
  first_name: 'Buyer',
  last_name: 'User',
  org_id: Org.find_by_name('Demo Buyer').id,
  email: 'buyer@nowhere.com',
  phone: '(585) 555-1212',
  password: 'secret',
  password_confirmation: 'secret'
)
User.create(
  username: 'supplier',
  first_name: 'Suplier',
  last_name: 'User',
  org_id: Org.find_by_name('Demo Supplier').id,
  email: 'supplier@nowhere.com',
  phone: '(585) 555-1212',
  password: 'secret',
  password_confirmation: 'secret'
)

Message.delete_all
Message.create(
  headline: "Old Message",
  content: Faker::Lorem.paragraph(10),
  start_date: Time.now - 2.months,
  end_date: Time.now - 1.month
)
Message.create(
  headline: "Current Message",
  content: Faker::Lorem.paragraph(10),
  start_date: Time.now - 1.month,
  end_date: Time.now + 1.month
)
Message.create(
  headline: "Another Current Message",
  content: Faker::Lorem.paragraph(10),
  start_date: Time.now - 1.month,
  end_date: Time.now + 1.month
)
Message.create(
  headline: "Future Message",
  content: Faker::Lorem.paragraph(10),
  start_date: Time.now + 1.month,
  end_date: Time.now + 2.months

)
