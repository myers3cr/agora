# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
#TODO add sample orgs