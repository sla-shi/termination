@Record = React.createClass
  handleView: (e) ->
    e.preventDefault()
    #console.log(@props.record.id)
    window.location = '/records/' + @props.record.id  

  render: ->
    React.DOM.tr {},
      React.DOM.td {}, @props.record.reserved1
      React.DOM.td {}, @props.record.name
      React.DOM.td {}, @props.record.created_date
      React.DOM.td {},
        React.DOM.a
          id: 'btn2'
          className: 'col s6 btn-primary waves-effect waves-light btn'
          onClick: @handleView
          'View'

