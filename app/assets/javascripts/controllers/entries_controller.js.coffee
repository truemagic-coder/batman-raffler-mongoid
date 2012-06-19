class BatmanRaffler.EntriesController extends Batman.Controller
  routingKey: 'entries'

  index: (params) ->
    BatmanRaffler.Entry.load (err, results) =>
      @set 'entries', BatmanRaffler.Entry.get('all')
      @set 'entry', new BatmanRaffler.Entry()

  create: (params) ->
    @get('entry').save (err) =>
      $('#new_entry').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        BatmanRaffler.flashSuccess "Ad #{@get('entry.name')} created successfully!"
        @set 'entry', new BatmanRaffler.Entry()
