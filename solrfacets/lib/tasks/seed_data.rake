namespace :db do
  desc 'Seed data into the database'
  task :seed_data => :environment do
    facet_words = %w[html5 rails twitter game cpp web desktop map mobile]

    Project.create!( {
      title: 'Hei',
      description: 'Hei Everyone, Organize',
      tag_list: %w[html5 rails web mobile]
    } );

    Project.create!( {
      title: 'Internet Monitor',
      description: "Scoring the world's countries",
      tag_list: %w[html5 rails web map]
    } );

    Project.create!( {
      title: 'Higgs, Evade',
      description: 'A casual game of particle physics',
      tag_list: %w[cpp game mobile]
    } );
  end
end

