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