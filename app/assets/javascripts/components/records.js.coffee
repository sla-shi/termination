@Records = React.createClass
  getInitialState: ->
    records: @props.data
    
  getDefaultProps: ->
    records: []

  handleView: (id) ->
    console.log(id)
    #window.location = '/records/' + id

  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Records'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Carrier'
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Date'
            React.DOM.th null, 'Commands'
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record
            