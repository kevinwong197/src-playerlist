<template>
  <div class="serverlist">
    <div class="container" v-if="filteredServers().length > 0">
      <div class="row">
        <div class="col">
          <server
            class="my-4"
            v-for="(server, i) in filteredServers()"
            :server="server"
            :key="i" />
        </div>
      </div>
    </div>
    <b-card v-else-if="ok()">No Results</b-card>
    <progress-bar class="serversprogress" v-else-if="loading()" />
    <b-card v-else>{{status}}</b-card>
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
      this.local = b
    })
    eventBus.$on('updateempty', (b) => {
      this.empty = b
    })
    this.init()
  },
  watch:{
    $route (to, from) {
      this.init()
    }
  },
  methods: {
    init () {
      let gamedir = this.$route.params.gamedir || 'synergy'
      let name = this.$route.params.name || this.$route.params.gamedir || 'synergy'
      eventBus.$emit('updategamelabel', name)
      eventBus.$emit('updategame', gamedir)
      eventBus.$emit('getservers')
    },
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
        this.status = 'Client Error: ' + err.response.statusText
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
    matchMap (server) {
      return this.map === '' ||
        server.map !== undefined &&
        server.map.includes(this.map)
    },
    matchEmpty (server) {
      return this.empty || server.players != 0
    },
    matchLocal (server) {
      return this.local || server.dedicated
    },
    filteredServers () {
      return this.servers.filter(server => {
        return this.matchMap(server) &&
          this.matchEmpty(server) &&
          this.matchLocal(server)
      }).slice(0, 20)
    }
  }
}
</script>

<style scoped>
/*.serverlist {
  background-color: #222222;
  color: #66ccff;
}*/
.serversprogress {
  border-radius: 0;
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
