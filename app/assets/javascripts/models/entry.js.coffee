class BatmanRaffler.Entry extends Batman.Model
  @resourceName: 'entry'
  @storageKey: 'entries'
  @persist Batman.RailsStorage
  @encode 'name', 'winner'

  @validate 'name', presence: true

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
