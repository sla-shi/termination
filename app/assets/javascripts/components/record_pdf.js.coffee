@RecordPdf = React.createClass
  
  getInitialState: ()->
      record: @props.data
      uid: @props.uid
  
  componentDidMount: ->
    #console.log(@props)
    #@uid = 
    #console.log(@state.uid)
    
  render: ->
    React.DOM.div
      className: ''
      React.DOM.div
        className: 'row'
        React.DOM.h4
          className: 'col s12'
          'Your letter is ready'
        React.DOM.iframe
          className: 'col s12'
          id: 'pdfcontainer'
          display: 'block'
          src: '/pdfjs/web/viewer.html?file=' + 
            window.location.protocol + '//' +
            window.location.hostname + '/' +
            @state.uid + '.pdf?' + 
            Math.floor((1 + Math.random()) * 0x10000)
            .toString(16)
            .substring(1)
          height: '350'
          width: '300'
          style: {border: 'none'}
      React.DOM.div
        className: 'row'
        React.DOM.button
          type: 'button'
          className: 'col s3 offset-s8 btn btn-primary'
          'Send It!'