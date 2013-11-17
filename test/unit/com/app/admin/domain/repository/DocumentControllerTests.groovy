package com.app.admin.domain.repository



import org.junit.*
import grails.test.mixin.*

@TestFor(DocumentController)
@Mock(Document)
class DocumentControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/document/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.documentInstanceList.size() == 0
        assert model.documentInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.documentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.documentInstance != null
        assert view == '/document/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/document/show/1'
        assert controller.flash.message != null
        assert Document.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/document/list'

        populateValidParams(params)
        def document = new Document(params)

        assert document.save() != null

        params.id = document.id

        def model = controller.show()

        assert model.documentInstance == document
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/document/list'

        populateValidParams(params)
        def document = new Document(params)

        assert document.save() != null

        params.id = document.id

        def model = controller.edit()

        assert model.documentInstance == document
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/document/list'

        response.reset()

        populateValidParams(params)
        def document = new Document(params)

        assert document.save() != null

        // test invalid parameters in update
        params.id = document.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/document/edit"
        assert model.documentInstance != null

        document.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/document/show/$document.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        document.clearErrors()

        populateValidParams(params)
        params.id = document.id
        params.version = -1
        controller.update()

        assert view == "/document/edit"
        assert model.documentInstance != null
        assert model.documentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/document/list'

        response.reset()

        populateValidParams(params)
        def document = new Document(params)

        assert document.save() != null
        assert Document.count() == 1

        params.id = document.id

        controller.delete()

        assert Document.count() == 0
        assert Document.get(document.id) == null
        assert response.redirectedUrl == '/document/list'
    }
}
