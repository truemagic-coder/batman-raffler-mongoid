class BatmanRaffler.Entry extends Batman.Model
  @storageKey: 'entries'
  @persist Batman.RailsStorage
  @encode 'id', 'name', 'winner', 'created_at', 'updated_at'

  win: ->
    @set('winner', true)
    $('.entry .winner').removeClass('highlight')
    $('#'+@get('id')+' .winner').addClass('highlight')
    @save()

  @drawWinner: (node, event)->
    entries = BatmanRaffler.Entry.get('all')
    num = Math.floor(Math.random()*(entries.length))
    entry = entries.toArray()[num]
    entry.win()
