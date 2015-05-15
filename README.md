# alfred-animal-crossing

![Villager info](http://i.imgur.com/FIg9pZU.png)

Use Alfred search to get information about your Animal Crossing villagers, and hit `enter` to get even more information from the Animal Crossing wiki.

**[Download][releases]**

## How to use

To invoke **alfred-animal-crossing**, simply type `ac` followed by the villager you would like more information about. The workflow will then display a list of all the available information for that villager, which you can then action by pressing `enter` to get taken to the Animal Crossing wiki for even more detail.

**alfred-animal-crossing** also allows you to filter by each piece of information per villager. If you enter `ac alfonso s`, **alfred-animal-crossing** will return `species, star sign, skill, style, favorite song`. You can filter for any piece of information. The available filters are:

* `gender`
* `personality`
* `species`
* `birthday`
* `sign` (Star sign)
* `phrase` (Initial phrase)
* `clothes` (Initial clothes)
* `skill`
* `goal`
* `coffee`
* `style`
* `song` (Favorite song)
* `appearances`
* `names` (Regional names)

As you can see, some filters have shortened names (e.g. Star sign → sign) to reduce typing. You can even press `tab` to autocomplete entries as you type. Some villagers from older games may not have all the information available, so only the relevant results will be returned.

## Credits

Thank you to:
* [konapun] for his [autocomplete] library
* [lrrfantasy] for his [alfred-feedback-xml-generation][xml] library
* Icons made by [Freepik] from [www.flaticon.com][flaticon]
* [Stephanie Hoogerwerf][stephanie] for icon tweaks

[releases]: https://github.com/goronfreeman/alfred-animal-crossing/releases
[konapun]: https://github.com/konapun
[autocomplete]: https://github.com/konapun/autocomplete
[lrrfantasy]: https://github.com/lrrfantasy
[xml]: https://github.com/lrrfantasy/alfred-feedback-xml-generation
[freepik]: http://www.freepik.com
[flaticon]: http://www.flaticon.com
[stephanie]: http://stephaniehoogerwerf.com/
