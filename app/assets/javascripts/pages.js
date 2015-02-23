$(function() {
      var drugSearch = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("name", "link"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      limit: 10,
      remote: {
        url: 'https://sleepy-tor-6329.herokuapp.com/drugs/query?q=%QUERY',
         filter: function(list) {
            console.log(list)
            return $.map(list, function(drug) { return { name: drug.name, link: drug.link }; });
        }
      } 
    });

    drugSearch.initialize();

    $('.typeahead').typeahead(null, {
      name: 'drugSearch',
      displayKey: 'name',
      source: drugSearch.ttAdapter(),
  templates: {
    suggestion: Handlebars.compile('<a href="{{link}}"><p>{{name}}</p></a>')
  }

    }); 


});