<template>
  <div class="container"
    v-bind:class="{'py-4': listNotExist(), 'py-0': listExist()}">
    <div v-if="filteredServers().length > 0">
      <server v-for="(server, i) in filteredServers()" v-bind:server="server" :key="i" />
    </div>
    <div v-else-if="ok()">No Results</div>
    <progress-bar v-else-if="loading()" />
    <div v-else>{{status}}</div>
  </div>
</template>

<script>
import Server from '@/components/servers/Server'
import ProgressBar from '@/components/ProgressBar'
import serverQuery from '@/services/serverQuery'
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      servers: [],
      status: 'Loading',
      game: '',
      map: '',
      local: false,
      empty: false
    }
  },
  components: {
    Server,
    ProgressBar
  },
  mounted () {
    eventBus.$on('getservers', () => {
      eventBus.$emit('resetplayers')
      this.getservers()
    })
    eventBus.$on('updategame', (game) => {
      this.game = game
    })
    eventBus.$on('updatemap', (map) => {
      this.map = map
    })
    eventBus.$on('updatelocal', (b) => {
      console.log('updated local')
      this.local = b
    })
    eventBus.$on('updateempty', (b) => {
      console.log('updated empty')
      this.empty = b
    })
    eventBus.$emit('updategamelabel', 'synergy')
    eventBus.$emit('updategame', 'synergy')
    eventBus.$emit('getservers')
  },
  methods: {
    getservers () {
      this.servers = []
      this.status = 'Loading'
      serverQuery.search(this.game).then(response => {
        console.log(response.data)
        this.status = response.data.status
        if (this.status === 'OK') {
          this.servers = response.data.servers
        } else {
          this.status = response.data.status
        }
      }, err => {
        console.log(err)
        this.status = 'client error'
      })
    },
    listNotExist () {
      return !(this.servers.length > 0)
    },
    listExist () {
      return (this.servers.length > 0)
    },
    ok () {
      return this.status === 'OK'
    },
    loading () {
      return this.status === 'Loading'
    },
    filteredServers () {
      return this.servers.filter(server => {
        return (this.empty && true || (server.players != 0)) &&
          (this.local && true || server.dedicated) &&
          ((this.map == '') && true || server.map.includes(this.map))
      })
    }
  }
}
</script>

<style scoped>
.container {
  background-color: #222222;
  color: #66ccff;
}
.row:nth-last-child(n+2) {
  border-bottom-width: 1px;
  border-bottom-color: #66ccff;
  border-bottom-style: solid;
}
@media (min-width: 768px) {
  .row:nth-last-child(n+2) {
    border-bottom-width: 0.1px;
  }
}
</style>
