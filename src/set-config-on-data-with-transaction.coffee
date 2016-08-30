_ = require 'lodash'
ReturnValue = require 'nanocyte-component-return-value'

class SetConfigOnDataWithTransaction extends ReturnValue
  constructor: (@metadata)->
    super @metadata

  onEnvelope: (envelope) =>
    { data, config } = envelope

    data = {} unless _.isObject data
    data[@metadata.transactionId] = config

    return data

module.exports = SetConfigOnDataWithTransaction
