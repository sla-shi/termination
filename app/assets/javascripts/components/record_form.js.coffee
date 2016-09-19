@RecordForm = React.createClass

    componentDidMount: ()-> 
      # Material select initialize
      $('#selectCarrier').material_select(@handleChangeCarrier);
      $('#type_of_contract').material_select(@handleChangeContract);
      $('#conditional_letter').material_select(@handleChangeLetter);

    componentDidUpdate: () ->
      # Material select initialize
      $('#selectCarrier').material_select(@handleChangeCarrier);
      $('#type_of_contract').material_select(@handleChangeContract);
      $('#conditional_letter').material_select(@handleChangeLetter);

    getInitialState: ()->
      selectCarrier: 'none'
  
      reserved1: ''

      name: ''
      address: ''
      city: ''
      state: ''
      ssn: ''
      
      contract_signed_date: ''
      type_of_contract: 'none'
      agreement: ''
      renewal_date: ''

      conditional_letter: 'none'
      agree_if_less_than: '100'

      
      showStep0: true
      showStep1: false
      showStep2: false
      showStep3: false

# Test data      
      # selectCarrier: 'att'

      # name: 'John Smith'
      # address: '1st Ave'
      # city: 'New York'
      # state: 'NY'
      # ssn: '1234567890'

      # contract_signed_date: '1/09/2010'
      # type_of_contract: 'months24'
      # agreement: 'AG-001'
      # renewal_date: '31/08/2011'
      
      # conditional_letter: 'yes'
      # agree_if_less_than: '100'

    handleStep3: ->
      
    validStep3: ->
      @state.conditional_letter != 'none'

    handleStep2: ->
      @setState { showStep0: false; showStep1: false; showStep2: false; showStep3: true; }

    validStep2: ->
      @state.type_of_contract != 'none'

    handleStep1: ->
      @setState { showStep0: false; showStep1: false; showStep2: true; showStep3: false; }

    validStep1: ->
      @state.name && @state.address && @state.city && @state.state

    handleStep0: ->
      if @state.selectCarrier != 'none'
        @setState { showStep0: false; showStep1: true; showStep2: false; showStep3: false; }

    validStep0: ->
      @state.selectCarrier!='none'

    handleChange: (e) ->
      if e
        name = e.target.name
        @setState "#{ name }": e.target.value  
      #console.log(@state)

    handleChangeCarrier: ->
      @setState selectCarrier: $('#selectCarrier')[0].value
      @setState reserved1: $('#selectCarrier')[0].value
      console.log(@state.reserved1)

    handleChangeContract: ->
      @setState type_of_contract: $('#type_of_contract')[0].value
      #console.log(@state.type_of_contract)

    handleChangeLetter: ->
      @setState conditional_letter: $('#conditional_letter')[0].value
      #console.log(@state.conditional_letter)

    handleSubmit: (e) ->
      #@props.handleNewRecord data
      #@setState @getInitialState()
      e.preventDefault()
      $.post 
         url: '/records', 
         data: { record: @state }
         success: (data) =>
          #console.log(data)
          window.location = '/records/' + data.id
        dataType: 'JSON'
        async: false
      
      # redirect to PDF view
      #$.ajax '/records',
      #  { record: @state},
      #  type: "POST",
      #  dataType: "json",
      #  async: false,
      #  error: (jqXHR, textStatus, errorThrown) ->
      #      $('body').append "AJAX Error: #{textStatus}"
      #  success: (data) ->
      #    console.log(data);
      #    window.location = '/records/#{data.id}';
       
    

    render: ->
      React.DOM.form
        className: ''
        id: 'pdf-form'
  # Step 0
        if @state.showStep0
          React.DOM.div
            className: 'row'
            id: 'step0'
            # text
            React.DOM.div
              className: 'col s12'
              React.DOM.h4
                className: ''
                'Say goodbye to your current cell company'
              React.DOM.p
                className: 'grey-text lighten-text-4 bigger'
                'Generate a FREE form ready for cancelling your contract in 2 easy steps.'
              React.DOM.p
                className: 'grey-text lighten-text-4 bigger'
                ''
            # Carriers Select Box
            React.DOM.div
              className: 'input-field col s12'
              React.DOM.select
                ref: 'carrier'
                className: 'grey-text lighten-text-2'
                id: 'selectCarrier'
                defaultValue: @state.selectCarrier
                React.DOM.option
                  className: ''
                  disabled: '1'
                  #selected: '1'
                  value: 'none'
                  'Select your carrier'
                React.DOM.option
                  className: ''
                  value: 'att'
                  'AT&T'
                React.DOM.option
                  className: ''
                  value: 'sprint'
                  'Sprint'
                React.DOM.option
                  className: ''
                  value: 't-mobile'
                  'T-Mobile'
                React.DOM.option
                  className: ''
                  value: 'verizon'
                  'Verizon'
            React.DOM.div
              className: 'offset-s8 col s4'
              React.DOM.a
                id: 'btn0'
                className: 'col s12 waves-effect waves-light btn'
                disabled: !@validStep0()
                onClick: @handleStep0
                'Next'

# Step 1
        if @state.showStep1
          React.DOM.div
            className: 'row'
            id: 'step1'
            # text
            React.DOM.div
              className: 'col s12'
            React.DOM.div
              className: 'col s12'
              React.DOM.h5
                className: ''
                'Step 1. Your personal details'
                
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'Full Name'
                name: 'name'
                id: 'name'
                value: @state.name
                onChange: @handleChange
                
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'Address'
                name: 'address'
                id: 'address'
                value: @state.address
                onChange: @handleChange
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'City'
                name: 'city'
                id: 'city'
                value: @state.city
                onChange: @handleChange
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'State'
                name: 'state'
                id: 'state'
                value: @state.state
                onChange: @handleChange
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'SSN'
                name: 'ssn'
                id: 'ssn'
                value: @state.ssn
                onChange: @handleChange
            React.DOM.div
              className: 'offset-s8 col s4'
              React.DOM.a
                id: 'btn1'
                className: 'col s12 waves-effect waves-light btn'
                disabled: !@validStep1()
                onClick: @handleStep1
                'Next'

# Step 2
        if @state.showStep2
          React.DOM.div
            className: 'row'
            id: 'step2'
            # text
            React.DOM.div
              className: 'col s12'
            React.DOM.div
              className: 'col s12'
              React.DOM.h5
                className: ''
                'Step 2. Your contract details'
                
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'Date signed (if known)'
                name: 'contract_signed_date'
                id: 'contract_signed_date'
                value: @state.contract_signed_date
                onChange: @handleChange
                
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'Document number (if known)'
                name: 'agreement'
                id: 'agreement'
                value: @state.agreement
                onChange: @handleChange
            # Type of contract Select Box
            React.DOM.div
              className: 'input-field col s12'
              React.DOM.select
                ref: 'type_of_contract'
                className: 'grey-text lighten-text-2'
                id: 'type_of_contract'
                defaultValue: @state.type_of_contract
                React.DOM.option
                  className: ''
                  disabled: '1'
                  #selected: '1'
                  value: 'none'
                  'Type of contract'
                React.DOM.option
                  className: ''
                  value: 'months24'
                  '24 months'
                React.DOM.option
                  className: ''
                  value: 'months36'
                  '36 months'
                React.DOM.option
                  className: ''
                  value: 'unlimited'
                  'unlimited'
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'Date renewed (if applicable)'
                name: 'renewal_date'
                id: 'renewal_date'
                value: @state.renewal_date
                onChange: @handleChange
            React.DOM.div
              className: 'offset-s8 col s4'
              React.DOM.a
                id: 'btn2'
                className: 'col s12 waves-effect waves-light btn'
                disabled: !@validStep2()
                onClick: @handleStep2
                'Next'

# Step 3
        if @state.showStep3
          React.DOM.div
            className: 'row'
            id: 'step2'
            # text
            React.DOM.div
              className: 'col s12'
            React.DOM.div
              className: 'col s12'
              React.DOM.h5
                className: ''
                'Step 3. Do you want to pay the Early Termination Fee (ETF)?'
            React.DOM.p
                className: 'grey-text lighten-text-4 bigger'
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy.'
              React.DOM.p
                className: 'grey-text lighten-text-4 bigger'
                ''
            # Type of contract Select Box
            React.DOM.div
              className: 'input-field col s12'
              React.DOM.select
                ref: 'conditional_letter'
                className: 'grey-text lighten-text-2'
                id: 'conditional_letter'
                defaultValue: @state.conditional_letter
                React.DOM.option
                  className: ''
                  disabled: '1'
                  #selected: '1'
                  value: 'none'
                  'Is the letter conditional?'
                React.DOM.option
                  className: ''
                  value: 'yes'
                  'yes'
                React.DOM.option
                  className: ''
                  value: 'no'
                  'no'
            React.DOM.div
              className: 'col s12'
              React.DOM.input
                type: 'text'
                className: 'input-field'
                placeholder: 'Only if ETF is lower than (if applicable)'
                name: 'agree_if_less_than'
                id: 'agree_if_less_than'
                value: @state.agree_if_less_than
                onChange: @handleChange
            React.DOM.div
              className: 'offset-s8 col s4'
              React.DOM.a
                id: 'btn3'
                className: 'col s12 waves-effect waves-light btn'
                disabled: !@validStep3()
                onClick: @handleSubmit
                'Make PDF'
