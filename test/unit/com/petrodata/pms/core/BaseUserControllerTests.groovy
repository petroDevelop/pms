package com.petrodata.pms.core



import org.junit.*
import grails.test.mixin.*

@TestFor(BaseUserController)
@Mock(BaseUser)
class BaseUserControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/baseUser/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.baseUserInstanceList.size() == 0
        assert model.baseUserInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.baseUserInstance != null
    }

    void testSave() {
        controller.save()

        assert model.baseUserInstance != null
        assert view == '/baseUser/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/baseUser/show/1'
        assert controller.flash.message != null
        assert BaseUser.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/baseUser/list'

        populateValidParams(params)
        def baseUser = new BaseUser(params)

        assert baseUser.save() != null

        params.id = baseUser.id

        def model = controller.show()

        assert model.baseUserInstance == baseUser
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/baseUser/list'

        populateValidParams(params)
        def baseUser = new BaseUser(params)

        assert baseUser.save() != null

        params.id = baseUser.id

        def model = controller.edit()

        assert model.baseUserInstance == baseUser
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/baseUser/list'

        response.reset()

        populateValidParams(params)
        def baseUser = new BaseUser(params)

        assert baseUser.save() != null

        // test invalid parameters in update
        params.id = baseUser.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/baseUser/edit"
        assert model.baseUserInstance != null

        baseUser.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/baseUser/show/$baseUser.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        baseUser.clearErrors()

        populateValidParams(params)
        params.id = baseUser.id
        params.version = -1
        controller.update()

        assert view == "/baseUser/edit"
        assert model.baseUserInstance != null
        assert model.baseUserInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/baseUser/list'

        response.reset()

        populateValidParams(params)
        def baseUser = new BaseUser(params)

        assert baseUser.save() != null
        assert BaseUser.count() == 1

        params.id = baseUser.id

        controller.delete()

        assert BaseUser.count() == 0
        assert BaseUser.get(baseUser.id) == null
        assert response.redirectedUrl == '/baseUser/list'
    }
}
