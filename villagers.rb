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

    puts feedback.to_xml
  end
end
