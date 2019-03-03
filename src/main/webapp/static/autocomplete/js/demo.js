/*jslint  browser: true, white: true, plusplus: true */
/*global $, countries */

$(function () {
    'use strict';

    var tagTeams = null;
    var tag = new Array();
    $.ajaxPostJson(ctx+"/rongCloud/queryCustomerTagConf", {}, function(result) {
    	if(result){
    		for(var i = 0;i < result.length;i++){
    			var value = result[i].tagName;
    			var newdata = {
    				value : value,
    				data : {
    					id : result[i].id
    				}
    			};
    			tag[i] = newdata;
    		}
    	}
    });
    
    //var nhlTeams = ['Anaheim Ducks', 'Atlanta Thrashers', 'Boston Bruins', 'Buffalo Sabres', 'Calgary Flames', 'Carolina Hurricanes', 'Chicago Blackhawks', 'Colorado Avalanche', 'Columbus Blue Jackets', 'Dallas Stars', 'Detroit Red Wings', 'Edmonton OIlers', 'Florida Panthers', 'Los Angeles Kings', 'Minnesota Wild', 'Montreal Canadiens', 'Nashville Predators', 'New Jersey Devils', 'New Rork Islanders', 'New York Rangers', 'Ottawa Senators', 'Philadelphia Flyers', 'Phoenix Coyotes', 'Pittsburgh Penguins', 'Saint Louis Blues', 'San Jose Sharks', 'Tampa Bay Lightning', 'Toronto Maple Leafs', 'Vancouver Canucks', 'Washington Capitals'];
   /* var tag = $.map(tagTeams, function (team) {
    	return { value: team.tagName, data: { id: team.id }}; 
    });*/

      // Initialize autocomplete with local lookup:
      $('#autocomplete').devbridgeAutocomplete({
          lookup: tag,
          minChars: 1,
          onSelect: function (suggestion) {
        	  $('#tagName').val(suggestion.value);
        	  $('#tagId').val(suggestion.data.id);
              //$('#selection').html('You selected: ' + suggestion.value + ', ' + suggestion.data.category);
          },
          showNoSuggestionNotice: true,
          noSuggestionNotice: 'Sorry, no matching results',
          groupBy: 'category'
      });
});