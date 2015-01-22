$(function() {
      var drugSearch = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("name", "link"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      limit: 10,
      remote: {
        url: 'http://localhost:3000/drugs/query?q=%QUERY',
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
      source: drugSearch.ttAdapter()
      
    }); 


})