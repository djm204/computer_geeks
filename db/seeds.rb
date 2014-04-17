# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Province.create(name: 'Alberta'               , pst_rate:       0, gst_rate:  0.05, hst_rate:    0)
Province.create(name: 'British Columbia'      , pst_rate:    0.07, gst_rate:  0.05, hst_rate:    0)
Province.create(name: 'Manitoba'              , pst_rate:    0.07, gst_rate:  0.05, hst_rate:    0)
Province.create(name: 'New Brunswick'         , pst_rate:    0.08, gst_rate:     0, hst_rate: 0.05)
Province.create(name: 'Newfoundland '         , pst_rate:    0.08, gst_rate:     0, hst_rate: 0.05)
Province.create(name: 'Northwest Territories' , pst_rate:       0, gst_rate:  0.05, hst_rate:    0)  
Province.create(name: 'Nova Scotia'           , pst_rate:    0.10, gst_rate:     0, hst_rate: 0.05)
Province.create(name: 'Nunavat'               , pst_rate:       0, gst_rate:  0.05, hst_rate:    0)
Province.create(name: 'Ontairo'               , pst_rate:    0.08, gst_rate:     0, hst_rate: 0.05)
Province.create(name: 'Prince Edward Island'  , pst_rate:    0.09, gst_rate:     0, hst_rate: 0.05)
Province.create(name: 'Quebec'                , pst_rate: 0.09975, gst_rate:  0.05, hst_rate:    0)
Province.create(name: 'Saskatchewan'          , pst_rate:    0.05, gst_rate:  0.05, hst_rate:    0)
Province.create(name: 'Yukon'                 , pst_rate:       0, gst_rate:  0.05, hst_rate:    0)

user = User.create(first_name: 'Computer', last_name: 'Geeks', email: 'info@computergeeks.ca', email_confirmation: 'info@computergeeks.ca',
            password: 'computer_geeks', password_confirmation: 'computer_geeks')

Address.create(user_id: user.id, address:'160 Princess St.', city: 'Winnipeg', country: 'Canada', postal_code: 'R3Y1M2',
	             province: Province.where("name ='Manitoba'")[0], phone_number: '204-985-2765')
Address.create(user_id: user.id, address:'650 Whoville St.', city: 'Calgary', country: 'Canada', postal_code: 'T1X 0L3',
	             province: Province.where("name ='Alberta'")[0], phone_number: '780-925-2368')
Address.create(user_id: user.id, address:'10 Salter St.', city: 'Cole Harbour', country: 'Canada', postal_code: 'B2V B2Z', 
	             province: Province.where("name ='Nova Scotia'")[0], phone_number: '902-585-0651')

Contact.create(page_title: 'Let\'s talk', page_left_description: 'At Computer Geeks we value your comments and suggestions.
	             Please contact us for any comments, suggestions or questions regarding Computer Geeks.
	             For sales questions or product availability please contact any of our stores.
               <br /><br /> info@computergeeks.ca')