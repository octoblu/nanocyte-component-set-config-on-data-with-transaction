ReturnValue = require 'nanocyte-component-return-value'
SetMessageOnDataWithTransaction = require '..'

describe 'SetMessageOnDataWithTransaction', ->
  beforeEach ->
    @sut = new SetMessageOnDataWithTransaction transactionId: 'hi'

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with config it should add to object', ->
      beforeEach ->
        @envelope =
          config: "test2"
          data: { 'yo': 'mama'}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal yo: 'mama', hi: 'test2'

    describe 'when called with null data it should create it and then add', ->
      beforeEach ->
        @envelope =
          config: "test2"
          data: null
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal hi: 'test2'

    describe 'when called with empty data it should add to object', ->
      beforeEach ->
        @envelope =
          config: "test2"
          data: {}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal hi: 'test2'

    describe 'when called with config in object form', ->
      beforeEach ->
        @envelope =
          config: {"test2" : 50}
          data: {'bleep':'blarg'}
      it 'should return the object', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal {'bleep':'blarg', 'hi':{"test2" : 50}}
