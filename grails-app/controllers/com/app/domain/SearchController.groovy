package com.app.domain

class SearchController {

    def index(String q, Long dateCreated, String sortFilter) {

        //results example (remove to add your real data)
        List<Map> results = [];
        8.times { i ->
            results.add([title:"Result ${i}",description:"This is the content of the search, place here a detailed description"])
        }
        [results:results,resultsCount:results.size()]
    }
}
