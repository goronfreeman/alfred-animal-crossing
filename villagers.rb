load 'alfred_feedback.rb'
load 'parser.rb'
load 'autocomplete.rb'
load 'villager_names.rb'
load 'feedback_data.rb'

villager, arg2 = ARGV

if villager
  @data = Parser.parse(villager)
  ac = Autocomplete.new %w('Gender', 'Personality', 'Species', 'Birthday', 'Sign', 'Phrase', 'Clothes',
                           'Skill', 'Goal', 'Coffee', 'Style', 'Song', 'Apperances', 'Names')
  ac.case_sensitive = false
  feedback = Feedback.new

  if arg2
    suggestions = ac.autocomplete(arg2)
    suggestions.each do |suggestion|
      fb_data = @feedback_data[suggestion.downcase.to_sym]
      fb_data[:subtitle] = @data[fb_data[:title]]
      fb_data[:arg] = 'http://animalcrossing.wikia.com/wiki/' + villager
      fb_data[:autocomplete] = villager + ' ' + fb_data[:uid]

      feedback.add_item(fb_data)

    end
    puts feedback.to_xml

  else
    @feedback_data.each do |key, val|
      if @data[key.to_s.capitalize]
        fb_data = @feedback_data[key]

        if key == 'Coffee'
          fb_data[:subtitle] = "#{@data['Coffee'].split(',').at(0) + ' beans, '}" \
                               "#{@data['Coffee'].downcase.split(',').at(1) + ', and '}" \
                               "#{@data['Coffee'].downcase.split(',').at(2) + '.'}"

        elsif key == 'Initial phrase'
          fb_data[:subtitle] = "#{@data['Initial phrase'].capitalize}"

        elsif key == 'Appearances'
          fb_data[:subtitle] = "#{@data['Appearances'].join(', ')}"

        elsif key == 'Regional names'
          subtitle_content = []
          @data['Regional names'].each do |k, v|
            subtitle_content.push(k + ': ' + v)
          end

          fb_data[:subtitle] = subtitle_content.join(', ')
        else
          fb_data[:subtitle] = @data[fb_data[:title]]
        end

        fb_data[:arg] = 'http://animalcrossing.wikia.com/wiki/' + villager
        fb_data[:autocomplete] = villager + ' ' + fb_data[:uid]

        feedback.add_item(fb_data)
      end
    end
    # feedback.add_item(
    #   title:        'Gender',
    #   subtitle:     "#{@data['Gender']}",
    #   uid:          'gender',
    #   arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
    #   icon:         {
    #     type:       'filetype',
    #     name:       './icons/gender.png'
    #   }
    # )
    #
    # feedback.add_item(
    #   title:        'Personality',
    #   subtitle:     "#{@data['Personality']}",
    #   uid:          'personality',
    #   arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Personality']}",
    #   icon:         {
    #     type:       'filetype',
    #     name:       './icons/personality.png'
    #   }
    # )
    #
    # feedback.add_item(
    #   title:        'Species',
    #   subtitle:     "#{@data['Species']}",
    #   uid:          'species',
    #   arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Species']}",
    #   icon:         {
    #     type:       'filetype',
    #     name:       './icons/species.png'
    #   }
    # )
    #
    # unless @data['Birthday'] == 'Unknown'
    #   feedback.add_item(
    #     title:        'Birthday',
    #     subtitle:     "#{@data['Birthday']}",
    #     uid:          'birthday',
    #     arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Birthday'].split.at(0)}",
    #     icon:         {
    #       type:       'filetype',
    #       name:       './icons/birthday.png'
    #     }
    #   )
    # end
    #
    # unless @data['Star sign'] == 'Unknown'
    #   feedback.add_item(
    #     title:        'Star sign',
    #     subtitle:     "#{@data['Star sign']}",
    #     uid:          'star',
    #     arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Star sign']}",
    #     icon:         {
    #       type:       'filetype',
    #       name:       './icons/star.png'
    #     }
    #   )
    # end
    #
    # feedback.add_item(
    #   title:        'Initial phrase',
    #   subtitle:     "#{@data['Initial phrase'].capitalize}",
    #   uid:          'phrase',
    #   arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
    #   icon:         {
    #     type:       'filetype',
    #     name:       './icons/phrase.png'
    #   }
    # )
    #
    # feedback.add_item(
    #   title:        'Initial clothes',
    #   subtitle:     "#{@data['Initial clothes']}",
    #   uid:          'clothes',
    #   arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
    #   icon:         {
    #     type:       'filetype',
    #     name:       './icons/clothes.png'
    #   }
    # )
    #
    # unless @data['Skill'].nil?
    #   feedback.add_item(
    #     title:        'Skill',
    #     subtitle:     "#{@data['Skill']}",
    #     uid:          'skill',
    #     arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
    #     icon:         {
    #       type:       'filetype',
    #       name:       './icons/skill.png'
    #     }
    #   )
    # end
    #
    # unless @data['Goal'].nil?
    #   feedback.add_item(
    #     title:        'Goal',
    #     subtitle:     "#{@data['Goal']}",
    #     uid:          'goal',
    #     arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
    #     icon:         {
    #       type:       'filetype',
    #       name:       './icons/goal.png'
    #     }
    #   )
    # end
    #
    # unless @data['Coffee'].nil?
    #   feedback.add_item(
    #     title:        'Coffee',
    #     subtitle:     "#{@data['Coffee'].split(',').at(0) + ' beans, '}" \
    #                   "#{@data['Coffee'].downcase.split(',').at(1) + ', and '}" \
    #                   "#{@data['Coffee'].downcase.split(',').at(2) + '.'}",
    #     uid:          'coffee',
    #     arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
    #     icon:         {
    #       type:       'filetype',
    #       name:       './icons/coffee.png'
    #     }
    #   )
    # end
    #
    # unless @data['Style'].nil?
    #   feedback.add_item(
    #     title:        'Style',
    #     subtitle:     "#{@data['Style']}",
    #     uid:          'style',
    #     arg:          'http://animalcrossing.wikia.com/wiki/Clothing_Styles#' + "#{@data['Style']}",
    #     icon:         {
    #       type:       'filetype',
    #       name:       './icons/style.png'
    #     }
    #   )
    # end
    #
    # unless @data['Favorite song'].nil?
    #   feedback.add_item(
    #     title:        'Favorite song',
    #     subtitle:     "#{@data['Favorite song']}",
    #     uid:          'song',
    #     arg:          'http://animalcrossing.wikia.com/wiki/' + "#{@data['Favorite song']}",
    #     icon:         {
    #       type:       'filetype',
    #       name:       './icons/song.png'
    #     }
    #   )
    # end
    #
    # feedback.add_item(
    #   title:        'Appearances',
    #   subtitle:     "#{@data['Appearances'].join(', ')}",
    #   uid:          'appearances',
    #   arg:          'http://animalcrossing.wikia.com/wiki/Animal_Crossing_(series)#Games',
    #   icon:         {
    #     type:       'filetype',
    #     name:       './icons/appearances.png'
    #   }
    # )
    #
    # subtitle_content = []
    # @data['Regional names'].each do |key, val|
    #   subtitle_content.push(key + ': ' + val)
    # end
    #
    # feedback.add_item(
    #   title:        'Regional names',
    #   subtitle:     subtitle_content.join(', '),
    #   uid:          'region',
    #   arg:          'http://animalcrossing.wikia.com/wiki/' + villager,
    #   icon:         {
    #     type:       'filetype',
    #     name:       './icons/region.png'
    #   }
    # )
    puts feedback.to_xml
  end
end
