load 'alfred_feedback.rb'
load 'parser.rb'

arg2, villager = ARGV

if villager
  @data = Parser.parse(villager)

  feedback = Feedback.new

  case arg2.capitalize
  when 'Gender'
    feedback.add_item(
      title:        'Gender',
      subtitle:     "#{@data['Gender']}",
      uid:          'gender',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/gender.png'
      }
    )
    puts feedback.to_xml

  when 'Personality'
    feedback.add_item(
      title:        'Personality',
      subtitle:     "#{@data['Personality']}",
      uid:          'personality',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Personality']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/personality.png'
      }
    )
    puts feedback.to_xml

  when 'Species'
    feedback.add_item(
      title:        'Species',
      subtitle:     "#{@data['Species']}",
      uid:          'species',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Species']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/species.png'
      }
    )
    puts feedback.to_xml

  when 'Birthday'
    feedback.add_item(
      title:        'Birthday',
      subtitle:     "#{@data['Birthday']}",
      uid:          'birthday',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Birthday'].split.at(0)}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/birthday.png'
      }
    )
    puts feedback.to_xml

  when 'Star sign'
    feedback.add_item(
      title:        'Star sign',
      subtitle:     "#{@data['Star sign']}",
      uid:          'star',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Star sign']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/star.png'
      }
    )
    puts feedback.to_xml

  when 'Initial phrase'
    feedback.add_item(
      title:        'Initial phrase',
      subtitle:     "#{@data['Initial phrase'].capitalize}",
      uid:          'phrase',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/phrase.png'
      }
    )
    puts feedback.to_xml

  when 'Initial clothes'
    feedback.add_item(
      title:        'Initial clothes',
      subtitle:     "#{@data['Initial clothes']}",
      uid:          'clothes',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/clothes.png'
      }
    )
    puts feedback.to_xml

  when 'Skill'
    feedback.add_item(
      title:        'Skill',
      subtitle:     "#{@data['Skill']}",
      uid:          'skill',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/skill.png'
      }
    )
    puts feedback.to_xml

  when 'Goal'
    feedback.add_item(
      title:        'Goal',
      subtitle:     "#{@data['Goal']}",
      uid:          'goal',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/goal.png'
      }
    )
    puts feedback.to_xml

  when 'Coffee'
    feedback.add_item(
      title:        'Coffee',
      subtitle:     "#{@data['Coffee'].split(',').at(0) + ' beans, '}" \
                    "#{@data['Coffee'].downcase.split(',').at(1) + ', and '}" \
                    "#{@data['Coffee'].downcase.split(',').at(2) + '.'}",
      uid:          'coffee',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/coffee.png'
      }
    )
    puts feedback.to_xml

  when 'Style'
    feedback.add_item(
      title:        'Style',
      subtitle:     "#{@data['Style']}",
      uid:          'style',
      arg:          'http://animalcrossing.wikia.com/wiki/Clothing_Styles#' + "#{@data['Style']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/style.png'
      }
    )
    puts feedback.to_xml

  when 'Favorite song'
    feedback.add_item(
      title:        'Favorite song',
      subtitle:     "#{@data['Favorite song']}",
      uid:          'song',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Favorite song']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/song.png'
      }
    )
    puts feedback.to_xml

  when 'Appearances'
    feedback.add_item(
      title:        'Appearances',
      subtitle:     "#{@data['Appearances'].join(', ')}",
      uid:          'appearances',
      arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/appearances.png'
      }
    )
    puts feedback.to_xml

  when 'Regional names'
    feedback.add_item(
      title:        'Regional names',
      subtitle:     # FIX THESE
                    'France: ' + "#{@data['Regional names'].split.at(0)}" + ', ' \
                    'Germany: ' + "#{@data['Regional names'].split.at(1)}" + ', ' \
                    'Spain: ' + "#{@data['Regional names'].split.at(2)}" + ', ' \
                    'Italy: ' + "#{@data['Regional names'].split.at(3)}",
      uid:          'region',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/region.png'
      }
    )
    puts feedback.to_xml

  else
    feedback.add_item(
      title:        'Gender',
      subtitle:     "#{@data['Gender']}",
      uid:          'gender',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/gender.png'
      }
    )

    feedback.add_item(
      title:        'Personality',
      subtitle:     "#{@data['Personality']}",
      uid:          'personality',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Personality']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/personality.png'
      }
    )

    feedback.add_item(
      title:        'Species',
      subtitle:     "#{@data['Species']}",
      uid:          'species',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Species']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/species.png'
      }
    )

    feedback.add_item(
      title:        'Birthday',
      subtitle:     "#{@data['Birthday']}",
      uid:          'birthday',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Birthday'].split.at(0)}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/birthday.png'
      }
    )

    feedback.add_item(
      title:        'Star sign',
      subtitle:     "#{@data['Star sign']}",
      uid:          'star',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Star sign']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/star.png'
      }
    )

    feedback.add_item(
      title:        'Initial phrase',
      subtitle:     "#{@data['Initial phrase'].capitalize}",
      uid:          'phrase',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/phrase.png'
      }
    )

    feedback.add_item(
      title:        'Initial clothes',
      subtitle:     "#{@data['Initial clothes']}",
      uid:          'clothes',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/clothes.png'
      }
    )

    feedback.add_item(
      title:        'Skill',
      subtitle:     "#{@data['Skill']}",
      uid:          'skill',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/skill.png'
      }
    )

    feedback.add_item(
      title:        'Goal',
      subtitle:     "#{@data['Goal']}",
      uid:          'goal',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/goal.png'
      }
    )

    feedback.add_item(
      title:        'Coffee',
      subtitle:     "#{@data['Coffee'].split(',').at(0) + ' beans, '}" \
                    "#{@data['Coffee'].downcase.split(',').at(1) + ', and '}" \
                    "#{@data['Coffee'].downcase.split(',').at(2) + '.'}",
      uid:          'coffee',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/coffee.png'
      }
    )

    feedback.add_item(
      title:        'Style',
      subtitle:     "#{@data['Style']}",
      uid:          'style',
      arg:          'http://animalcrossing.wikia.com/wiki/Clothing_Styles#' + "#{@data['Style']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/style.png'
      }
    )

    feedback.add_item(
      title:        'Favorite song',
      subtitle:     "#{@data['Favorite song']}",
      uid:          'song',
      arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Favorite song']}",
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/song.png'
      }
    )

    feedback.add_item(
      title:        'Appearances',
      subtitle:     "#{@data['Appearances'].join(', ')}",
      uid:          'appearances',
      arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/appearances.png'
      }
    )

    feedback.add_item(
      title:        'Regional names',
      subtitle:     # FIX THESE
                    'France: ' + "#{@data['Regional names'].split.at(0)}" + ', ' \
                    'Germany: ' + "#{@data['Regional names'].split.at(1)}" + ', ' \
                    'Spain: ' + "#{@data['Regional names'].split.at(2)}" + ', ' \
                    'Italy: ' + "#{@data['Regional names'].split.at(3)}",
      uid:          'region',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/region.png'
      }
    )
    puts feedback.to_xml
  end
end
