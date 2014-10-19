package com.app.pages

import geb.Page

class HomePage extends Page {
    static url = '/'

    static at = {
        title == 'Dashboard'
    }

    static content = {
        usersBox { $('a', text: 'Users') }
        documentsBox { $('a', text: 'Documents') }
        helpBox { $('a', text: 'Help') }
    }

}
