load 'alfred_feedback.rb'
load 'parser.rb'

villager, arg2 = ARGV

if villager
  @data = Parser.parse(villager)

  feedback = Feedback.new

  if arg2
    case arg2.capitalize
    when 'Gender'
      feedback.add_item(
        title:        'Gender',
        subtitle:     "#{@data['Gender']}",
        uid:          'gender',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        # autocomplete: villager + 'gender',
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
        # autocomplete: 'AC',
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
        # autocomplete: 'AC',
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
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/birthday.png'
        }
      )
      puts feedback.to_xml

    when 'Sign'
      feedback.add_item(
        title:        'Star sign',
        subtitle:     "#{@data['Star sign']}",
        uid:          'star',
        arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Star sign']}",
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/star.png'
        }
      )
      puts feedback.to_xml

    when 'Phrase'
      feedback.add_item(
        title:        'Initial phrase',
        subtitle:     "#{@data['Initial phrase'].capitalize}",
        uid:          'phrase',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/phrase.png'
        }
      )
      puts feedback.to_xml

    when 'Clothes'
      feedback.add_item(
        title:        'Initial clothes',
        subtitle:     "#{@data['Initial clothes']}",
        uid:          'clothes',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/clothes.png'
        }
      )
      puts feedback.to_xml

    when 'Skill'
      unless @data['Skill'].nil?
        feedback.add_item(
          title:        'Skill',
          subtitle:     "#{@data['Skill']}",
          uid:          'skill',
          arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
          # autocomplete: 'AC',
          icon:         {
            type:       'filetype',
            name:       './icons/skill.png'
          }
        )
      end
      puts feedback.to_xml

    when 'Goal'
      unless @data['Goal'].nil?
        feedback.add_item(
          title:        'Goal',
          subtitle:     "#{@data['Goal']}",
          uid:          'goal',
          arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
          # autocomplete: 'AC',
          icon:         {
            type:       'filetype',
            name:       './icons/goal.png'
          }
        )
      end
      puts feedback.to_xml

    when 'Coffee'
      unless @data['Coffee'].nil?
        feedback.add_item(
          title:        'Coffee',
          subtitle:     "#{@data['Coffee'].split(',').at(0) + ' beans, '}" \
                        "#{@data['Coffee'].downcase.split(',').at(1) + ', and '}" \
                        "#{@data['Coffee'].downcase.split(',').at(2) + '.'}",
          uid:          'coffee',
          arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
          # autocomplete: 'AC',
          icon:         {
            type:       'filetype',
            name:       './icons/coffee.png'
          }
        )
      end
      puts feedback.to_xml

    when 'Style'
      unless @data['Style'].nil?
        feedback.add_item(
          title:        'Style',
          subtitle:     "#{@data['Style']}",
          uid:          'style',
          arg:          'http://animalcrossing.wikia.com/wiki/Clothing_Styles#' + "#{@data['Style']}",
          # autocomplete: 'AC',
          icon:         {
            type:       'filetype',
            name:       './icons/style.png'
          }
        )
      end
      puts feedback.to_xml

    when 'Song'
      unless @data['Favorite song'].nil?
        feedback.add_item(
          title:        'Favorite song',
          subtitle:     "#{@data['Favorite song']}",
          uid:          'song',
          arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Favorite song']}",
          # autocomplete: 'AC',
          icon:         {
            type:       'filetype',
            name:       './icons/song.png'
          }
        )
      end
      puts feedback.to_xml

    when 'Appearances'
      feedback.add_item(
        title:        'Appearances',
        subtitle:     "#{@data['Appearances'].join(', ')}",
        uid:          'appearances',
        arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/appearances.png'
        }
      )
      puts feedback.to_xml

    when 'Names'
      subtitle_content = []
      @data['Regional names'].each do |key, val|
        subtitle_content.push(key + ': ' + val)
      end

      feedback.add_item(
        title:        'Regional names',
        subtitle:     subtitle_content.join(', '),
        uid:          'region',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/region.png'
        }
      )
      puts feedback.to_xml
    end

  else
    feedback.add_item(
      title:        'Gender',
      subtitle:     "#{@data['Gender']}",
      uid:          'gender',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      # autocomplete: 'AC',
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
      # autocomplete: 'AC',
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
      # autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/species.png'
      }
    )

    unless @data['Birthday'] == 'Unknown'
      feedback.add_item(
        title:        'Birthday',
        subtitle:     "#{@data['Birthday']}",
        uid:          'birthday',
        arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Birthday'].split.at(0)}",
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/birthday.png'
        }
      )
    end

    unless @data['Star sign'] == 'Unknown'
      feedback.add_item(
        title:        'Star sign',
        subtitle:     "#{@data['Star sign']}",
        uid:          'star',
        arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Star sign']}",
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/star.png'
        }
      )
    end

    feedback.add_item(
      title:        'Initial phrase',
      subtitle:     "#{@data['Initial phrase'].capitalize}",
      uid:          'phrase',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      # autocomplete: 'AC',
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
      # autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/clothes.png'
      }
    )

    unless @data['Skill'].nil?
      feedback.add_item(
        title:        'Skill',
        subtitle:     "#{@data['Skill']}",
        uid:          'skill',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/skill.png'
        }
      )
    end

    unless @data['Goal'].nil?
      feedback.add_item(
        title:        'Goal',
        subtitle:     "#{@data['Goal']}",
        uid:          'goal',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/goal.png'
        }
      )
    end

    unless @data['Coffee'].nil?
      feedback.add_item(
        title:        'Coffee',
        subtitle:     "#{@data['Coffee'].split(',').at(0) + ' beans, '}" \
                      "#{@data['Coffee'].downcase.split(',').at(1) + ', and '}" \
                      "#{@data['Coffee'].downcase.split(',').at(2) + '.'}",
        uid:          'coffee',
        arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/coffee.png'
        }
      )
    end

    unless @data['Style'].nil?
      feedback.add_item(
        title:        'Style',
        subtitle:     "#{@data['Style']}",
        uid:          'style',
        arg:          'http://animalcrossing.wikia.com/wiki/Clothing_Styles#' + "#{@data['Style']}",
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/style.png'
        }
      )
    end

    unless @data['Favorite song'].nil?
      feedback.add_item(
        title:        'Favorite song',
        subtitle:     "#{@data['Favorite song']}",
        uid:          'song',
        arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Favorite song']}",
        # autocomplete: 'AC',
        icon:         {
          type:       'filetype',
          name:       './icons/song.png'
        }
      )
    end

    feedback.add_item(
      title:        'Appearances',
      subtitle:     "#{@data['Appearances'].join(', ')}",
      uid:          'appearances',
      arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
      # autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/appearances.png'
      }
    )

    subtitle_content = []
    @data['Regional names'].each do |key, val|
      subtitle_content.push(key + ': ' + val)
    end

    feedback.add_item(
      title:        'Regional names',
      subtitle:     subtitle_content.join(', '),
      uid:          'region',
      arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
      # autocomplete: 'AC',
      icon:         {
        type:       'filetype',
        name:       './icons/region.png'
      }
    )
    puts feedback.to_xml
  end
end
